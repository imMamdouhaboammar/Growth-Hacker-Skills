#!/usr/bin/env python3
from __future__ import annotations

import json
import re
import sys
from collections import defaultdict, deque
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
GRAPH_PATH = ROOT / "skill-graph.json"


def fail(message: str) -> None:
    print(f"ERROR: {message}", file=sys.stderr)
    raise SystemExit(1)


def load_json(path: Path) -> dict:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError:
        fail(f"missing file: {path.relative_to(ROOT)}")
    except json.JSONDecodeError as exc:
        fail(f"invalid JSON in {path.relative_to(ROOT)}: {exc}")


def frontmatter_value(content: str, key: str) -> str | None:
    match = re.search(rf"^{re.escape(key)}:\s*(.+)$", content, flags=re.MULTILINE)
    return match.group(1).strip() if match else None


def main() -> None:
    graph = load_json(GRAPH_PATH)

    required_top = {"name", "version", "owner", "router", "contextBus", "nodes", "edges", "guards"}
    missing_top = required_top.difference(graph)
    if missing_top:
        fail(f"skill-graph.json missing fields: {sorted(missing_top)}")

    if graph["name"] != "growth-hacker-skills":
        fail("graph name must be growth-hacker-skills")

    nodes = graph["nodes"]
    if not isinstance(nodes, list) or not nodes:
        fail("nodes must be a non-empty array")

    node_map: dict[str, dict] = {}
    for node in nodes:
        node_id = node.get("id")
        if not node_id:
            fail("every node needs an id")
        if node_id in node_map:
            fail(f"duplicate node id: {node_id}")
        node_map[node_id] = node

        for field in ("path", "stage", "consumes", "produces"):
            if field not in node:
                fail(f"node {node_id} missing {field}")

        path = ROOT / node["path"]
        if not path.is_file():
            fail(f"node {node_id} points to missing file: {node['path']}")

        if path.name == "SKILL.md":
            content = path.read_text(encoding="utf-8")
            if not content.startswith("---\n"):
                fail(f"node {node_id} SKILL.md lacks YAML frontmatter")

        plugin_path = node.get("pluginPath")
        if plugin_path and not (ROOT / plugin_path).is_file():
            fail(f"node {node_id} pluginPath is missing: {plugin_path}")

    router = graph["router"]
    if router not in node_map:
        fail(f"router node does not exist: {router}")

    context_bus = graph["contextBus"]
    template = context_bus.get("template")
    if not template or not (ROOT / template).is_file():
        fail(f"context template is missing: {template}")

    adjacency: dict[str, set[str]] = defaultdict(set)
    edge_keys: set[tuple[str, str, str]] = set()

    for edge in graph["edges"]:
        for field in ("from", "to", "when", "carries"):
            if field not in edge:
                fail(f"edge missing {field}: {edge}")

        source = edge["from"]
        target = edge["to"]
        condition = edge["when"]

        if source not in node_map:
            fail(f"edge source is unknown: {source}")
        if target not in node_map:
            fail(f"edge target is unknown: {target}")
        if source == target:
            fail(f"self-link is not allowed: {source}")
        if not edge["carries"]:
            fail(f"edge {source} -> {target} carries no context")

        key = (source, target, condition)
        if key in edge_keys:
            fail(f"duplicate edge: {source} -> {target} ({condition})")
        edge_keys.add(key)
        adjacency[source].add(target)

    visited = {router}
    queue = deque([router])
    while queue:
        current = queue.popleft()
        for target in adjacency[current]:
            if target not in visited:
                visited.add(target)
                queue.append(target)

    unreachable = sorted(set(node_map).difference(visited))
    if unreachable:
        fail(f"nodes unreachable from router: {unreachable}")

    root_skill = ROOT / "SKILL.md"
    plugin_skill = ROOT / "skills" / "growth-hacker-skills" / "SKILL.md"
    if not plugin_skill.is_file():
        fail("Claude plugin router is missing")

    root_content = root_skill.read_text(encoding="utf-8")
    plugin_content = plugin_skill.read_text(encoding="utf-8")

    if frontmatter_value(root_content, "name") != "growth-hacker-skills":
        fail("root SKILL.md name is invalid")
    if frontmatter_value(plugin_content, "name") != "growth-hacker-skills":
        fail("plugin router skill name is invalid")
    if "../../SKILL.md" not in plugin_content:
        fail("plugin router does not reference the canonical root SKILL.md")
    if "../../skill-graph.json" not in plugin_content:
        fail("plugin router does not reference skill-graph.json")

    expected_owner = graph["owner"].get("name")
    if expected_owner != "Mamdouh Aboammar":
        fail("graph owner must be Mamdouh Aboammar")

    print("skill graph validation passed")
    print(f"nodes: {len(node_map)}")
    print(f"edges: {len(graph['edges'])}")
    print(f"router: {router}")
    print(f"reachable nodes: {len(visited)}")


if __name__ == "__main__":
    main()

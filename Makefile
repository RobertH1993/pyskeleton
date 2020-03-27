typehint:
	mypy src/ tests/

test:
	pytest tests/

lint:
	pylint src/ tests/

format:
	black src/

.PHONY: typehint test lint checklist

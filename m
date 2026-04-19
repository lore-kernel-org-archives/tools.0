Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48E9279DB3
	for <tools@linux.kernel.org>; Sun, 19 Apr 2026 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614407; cv=none; b=A90Zyrov0pAfB473i6v+cmMKfiN6HG7LcqJb2HRWYEQueh0n2P26vqr9DQr7ZZ8GebC39UyfRaIAtPCxhWIcV8kgKHRCHe75gF9dMQVVFFQTrTZmgJl1KD5hNp9pH3HfpQQGKq9+gWHlDpRZrMd3kUoNS+2YKvN04uKucN0wo9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614407; c=relaxed/simple;
	bh=Ka9emqI11gSNggWT+hiNNtv3Fj0Qx5Ble+9LMVbxktM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4KCegBARTBIwlnJHuIZCZoy8+HM5hvrT6W2zKBhPr/HU7jXm60rVZnHb65En+ZG2/whkwUviDNMPdzvcsMIDocuuPgXfpl01P9NbhLqr8UFRFYocRdlISM0h7VXwj69dsROoFU13fKDXznI9auZZuTC0TffU1+66bv/mJGsysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMIBWqCG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMIBWqCG"
Received: by smtp.kernel.org (Postfix)
	id 6570FC2BCAF; Sun, 19 Apr 2026 16:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E641DC2BCB3;
	Sun, 19 Apr 2026 16:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776614407;
	bh=Ka9emqI11gSNggWT+hiNNtv3Fj0Qx5Ble+9LMVbxktM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KMIBWqCG/O4BTzhWPpKB/rJ+YG4U2v2+0F95yUP+P8vsYjvRedlMecA7GnpafBq8H
	 JGZGejzzLmKxfvK//vUyghMQrPMhuL6AkxXgZ67uEMTQR4YbRnmqTZcoFMzTJbbFKB
	 sGewan2RKQtUtjSDIPZu9676yh8Cl9YfwGL8JKS9Kfb8rzC95MZdjT7ZnCWwSaOKLg
	 WCpLOGVVeo9H1qBXwiagor9Jz4ggBqXnGs6EIxIWt0OzwK8NsK8dsFe7VIV3LLVOYV
	 VolaSfr4myaelUe37Mu81N5+Fm5+gIaYqPms8J7zOHM98XtmeL1jgfzrDXivYDlQrI
	 UsGzcZrPdFsEg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 19 Apr 2026 11:59:57 -0400
Subject: [PATCH b4 v2 02/11] Add ruff checks to CI
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260419-ruff-check-v2-2-089dfb264501@kernel.org>
References: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
In-Reply-To: <20260419-ruff-check-v2-0-089dfb264501@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=52804; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Ka9emqI11gSNggWT+hiNNtv3Fj0Qx5Ble+9LMVbxktM=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlP/jBvXHj2j/0BI/mdeaqsbfd5Z7CG7/QTPxGw9LnlF
 wab55rCHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKa6YCMjw5F3Rx8pB7N6rrN1mvh4G5tvUHfr/Yp9t3fu4PjAdCXsQBEjQ/vzr4r
 7mhrlvbZNnV/4x1fk6tQpKWWrG4WS41+drKtr5wcA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Mark example-only variables as intentionally unused so ruff can check
the script without changing its illustrative structure.

Change `ruff.lint.select` to `ruff.lint.extend-select` to enable default
lints and fix ambiguous variable name warnings.

Enable import sorting and use `ruff check --fix` to fix existing
violations.

Configure ruff to skip submodules.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 ci.sh                              |  1 +
 misc/review-ci-example.py          |  4 +-
 misc/send-receive.py               | 30 +++++++-------
 pyproject.toml                     |  6 ++-
 src/b4/__init__.py                 | 67 +++++++++++++++++-------------
 src/b4/bugs/__init__.py            |  8 ++--
 src/b4/bugs/_tui.py                |  7 ++--
 src/b4/command.py                  |  4 +-
 src/b4/diff.py                     | 16 +++----
 src/b4/dig.py                      | 13 +++---
 src/b4/ez.py                       | 33 ++++++++-------
 src/b4/kr.py                       |  2 +-
 src/b4/mbox.py                     | 28 ++++++-------
 src/b4/pr.py                       | 24 +++++------
 src/b4/review/__init__.py          | 29 ++++++++-----
 src/b4/review/_review.py           |  3 +-
 src/b4/review/checks.py            |  1 -
 src/b4/review/messages.py          |  1 -
 src/b4/review/tracking.py          |  7 ++--
 src/b4/review_tui/__init__.py      | 20 +++++----
 src/b4/review_tui/_common.py       | 85 ++++++++++++++++++++++++++------------
 src/b4/review_tui/_entry.py        |  3 +-
 src/b4/review_tui/_lite_app.py     | 19 +++++----
 src/b4/review_tui/_modals.py       | 51 ++++++++++++++---------
 src/b4/review_tui/_pw_app.py       | 28 ++++++++-----
 src/b4/review_tui/_review_app.py   | 56 ++++++++++++++++---------
 src/b4/review_tui/_tracking_app.py | 53 +++++++++++++++++-------
 src/b4/tui/_common.py              |  8 ++--
 src/b4/tui/_modals.py              | 11 +++--
 src/b4/ty.py                       | 19 ++++-----
 src/tests/conftest.py              |  7 ++--
 src/tests/test___init__.py         | 24 +++++++----
 src/tests/test_ez.py               | 11 ++---
 src/tests/test_mbox.py             | 11 ++---
 src/tests/test_patatt.py           |  3 +-
 src/tests/test_rethread.py         |  4 +-
 src/tests/test_review.py           | 12 +++---
 src/tests/test_review_checks.py    |  1 -
 src/tests/test_review_show_info.py |  5 +--
 src/tests/test_review_tracking.py  | 12 +++---
 src/tests/test_three_way_merge.py  |  7 ++--
 src/tests/test_tui_bugs.py         |  4 +-
 src/tests/test_tui_modals.py       |  6 +--
 src/tests/test_tui_review.py       |  6 +--
 src/tests/test_tui_tracking.py     | 13 +++---
 45 files changed, 436 insertions(+), 327 deletions(-)

diff --git a/ci.sh b/ci.sh
index 89a5a80..b65ae97 100755
--- a/ci.sh
+++ b/ci.sh
@@ -2,4 +2,5 @@
 
 set -eu
 
+uv run ruff check
 uv run mypy .
diff --git a/misc/review-ci-example.py b/misc/review-ci-example.py
index e5837eb..cbac2ae 100755
--- a/misc/review-ci-example.py
+++ b/misc/review-ci-example.py
@@ -43,7 +43,7 @@ import sys
 
 def main() -> None:
     msg = email.message_from_binary_file(sys.stdin.buffer)
-    subject = msg.get('subject', '(no subject)')
+    subject = msg.get('subject', '(no subject)')  # noqa: F841
     msgid = msg.get('message-id', '').strip('<> ')
 
     # Example: read tracking data for commit-based CI lookups
@@ -53,7 +53,7 @@ def main() -> None:
             tracking = json.load(fp)
         branch_tips = tracking.get('series', {}).get('branch-tips', [])
     else:
-        branch_tips = []
+        branch_tips = []  # noqa: F841
 
     # Seed the RNG with the message-id so results are stable across
     # repeated runs of the same message (simulates cached CI results).
diff --git a/misc/send-receive.py b/misc/send-receive.py
index a3dd893..35c5e99 100644
--- a/misc/send-receive.py
+++ b/misc/send-receive.py
@@ -1,29 +1,29 @@
 #!/usr/bin/env python3
 
-import falcon
-import os
-import sys
-import logging
-import logging.handlers
-import json
-import sqlalchemy as sa
-import patatt
-import smtplib
+import copy
 import email
 import email.header
 import email.policy
 import email.quoprimime
+import json
+import logging
+import logging.handlers
+import os
 import re
-import ezpi
-import copy
+import smtplib
+import sys
 import textwrap
-
 from configparser import ConfigParser, ExtendedInterpolation
+from email import charset, utils
 from string import Template
-from email import utils
-from typing import Tuple, Union, List
+from typing import List, Tuple, Union
+
+import ezpi
+import falcon
+import sqlalchemy as sa
+
+import patatt
 
-from email import charset
 charset.add_charset('utf-8', None)
 emlpolicy = email.policy.EmailPolicy(utf8=True, cte_type='8bit', max_line_length=None)
 
diff --git a/pyproject.toml b/pyproject.toml
index 867fcae..6eb2fbb 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -82,13 +82,17 @@ files = [
     {filename = "src/b4/man/b4.1"},
 ]
 
+[tool.ruff]
+extend-exclude = ["ezgb", "liblore", "patatt"]
+
 [tool.ruff.lint]
-select = [
+extend-select = [
     "F",       # https://docs.astral.sh/ruff/rules/#pyflakes-f
     "B007",    # https://docs.astral.sh/ruff/rules/unused-loop-control-variable/
     "B904",    # https://docs.astral.sh/ruff/rules/raise-without-from-err/
     "DTZ",     # https://docs.astral.sh/ruff/rules/#flake8-datetimez-dtz
     "G",       # https://docs.astral.sh/ruff/rules/#flake8-logging-format-g
+    "I",       # https://docs.astral.sh/ruff/rules/#isort-i
     "PERF102", # https://docs.astral.sh/ruff/rules/incorrect-dict-iterator/
     "PGH004",  # https://docs.astral.sh/ruff/rules/blanket-noqa/
     "PIE790",  # https://docs.astral.sh/ruff/rules/unnecessary-placeholder/
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 75238bb..1e4c91e 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1,50 +1,61 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
-import subprocess
-import logging
-import hashlib
-import re
-import sys
-import os
-import fnmatch
+import argparse
+import copy
+import datetime
 import email.generator
 import email.header
 import email.parser
 import email.policy
 import email.quoprimime
 import email.utils
-import tempfile
+import fnmatch
+import hashlib
+import io
+import json
+import logging
+import mailbox
+import os
 import pathlib
-import argparse
-import smtplib
+import pwd
+import re
 import shlex
+import shutil
+import smtplib
+import subprocess
+import sys
+import tempfile
 import textwrap
-import json
-
-import urllib.parse
-import datetime
 import time
-import copy
-import shutil
-import mailbox
-import pwd
-import io
+import urllib.parse
+from contextlib import contextmanager
+from email import charset
+from email.message import EmailMessage
+from pathlib import Path
+from typing import (
+    Any,
+    BinaryIO,
+    Dict,
+    Generator,
+    Iterator,
+    List,
+    Literal,
+    Optional,
+    Sequence,
+    Set,
+    Tuple,
+    TypeVar,
+    Union,
+    overload,
+)
 
+import liblore.utils
 import requests
 
 import liblore
-import liblore.utils
-
-from pathlib import Path
-from contextlib import contextmanager
-from typing import Optional, Tuple, Set, List, BinaryIO, Union, Sequence, Literal, Iterator, Dict, \
-    TypeVar, overload, Generator, Any
 
 ConfigDictT = Dict[str, Union[str, List[str], None]]
 
-from email.message import EmailMessage
-
-from email import charset
 
 charset.add_charset('utf-8', None)
 # Policy we use for saving mail locally
diff --git a/src/b4/bugs/__init__.py b/src/b4/bugs/__init__.py
index dd28b5a..cb21611 100644
--- a/src/b4/bugs/__init__.py
+++ b/src/b4/bugs/__init__.py
@@ -4,15 +4,15 @@
 # Copyright (C) 2020 by the Linux Foundation
 """b4 bugs: manage bug reports from mailing list threads."""
 import argparse
+import json
 import logging
+import shutil
 import sys
 
-import json
-import shutil
+from ezgb._git import git_bug_cli
 
 import b4
 from ezgb import BugNotFoundError, GitBugRepo, Status
-from ezgb._git import git_bug_cli
 
 logger = logging.getLogger('b4')
 
@@ -160,7 +160,7 @@ def cmd_list(cmdargs: argparse.Namespace) -> None:
 
     for bug in bugs:
         icon = '\u25cf' if bug.status == Status.OPEN else '\u25cb'
-        labels = ' '.join(f'[{l}]' for l in sorted(bug.labels))
+        labels = ' '.join(f'[{label}]' for label in sorted(bug.labels))
         logger.info('%s %s  %s  %s',
                     icon, bug.id[:7], bug.title, labels)
 
diff --git a/src/b4/bugs/_tui.py b/src/b4/bugs/_tui.py
index 0309a0c..998e6bb 100644
--- a/src/b4/bugs/_tui.py
+++ b/src/b4/bugs/_tui.py
@@ -14,14 +14,13 @@ from typing import TYPE_CHECKING, Optional, Union
 if TYPE_CHECKING:
     from textual.events import Key
 
-from textual.events import Click, MouseScrollDown, MouseScrollUp
-
 from rich import box
 from rich.panel import Panel
 from rich.text import Text
 from textual.app import App, ComposeResult
 from textual.binding import Binding
 from textual.containers import Horizontal, Vertical
+from textual.events import Click, MouseScrollDown, MouseScrollUp
 from textual.screen import ModalScreen
 from textual.suggester import SuggestFromList
 from textual.widgets import (
@@ -34,6 +33,8 @@ from textual.widgets import (
 )
 from textual.worker import Worker, WorkerState
 
+import b4
+from b4.bugs._import import is_comment_removed, make_tombstone, parse_comment_header
 from b4.tui import (
     ActionScreen,
     ConfirmScreen,
@@ -47,8 +48,6 @@ from b4.tui import (
     resolve_styles,
     reviewer_colours,
 )
-import b4
-from b4.bugs._import import is_comment_removed, make_tombstone, parse_comment_header
 from ezgb import Bug, BugSummary, Comment, GitBugRepo, Status
 
 # Union type for items that can appear in the bug list.
diff --git a/src/b4/command.py b/src/b4/command.py
index 79ec596..7ebe79c 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -7,11 +7,11 @@ __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
 import argparse
 import logging
-import b4
 import sys
-
 from typing import Any, Optional, Sequence, Union
 
+import b4
+
 logger = b4.logger
 
 
diff --git a/src/b4/diff.py b/src/b4/diff.py
index 934b9ac..8045243 100644
--- a/src/b4/diff.py
+++ b/src/b4/diff.py
@@ -5,19 +5,19 @@
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
-import os
-import sys
-import b4
-import b4.mbox
+import argparse
 import email
 import email.parser
-import shutil
+import os
 import pathlib
-import argparse
 import shlex
-
-from typing import Tuple, Optional, List
+import shutil
+import sys
 from email.message import EmailMessage
+from typing import List, Optional, Tuple
+
+import b4
+import b4.mbox
 
 logger = b4.logger
 
diff --git a/src/b4/dig.py b/src/b4/dig.py
index f13deac..b3d637d 100644
--- a/src/b4/dig.py
+++ b/src/b4/dig.py
@@ -5,19 +5,18 @@
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
-import sys
-import b4
 import argparse
+import datetime
+import email.utils
 import re
+import sys
 import urllib.parse
-import datetime
+from email.message import EmailMessage
+from typing import List, Optional, Set
 
+import b4
 import b4.mbox
 
-from email.message import EmailMessage
-import email.utils
-from typing import List, Set, Optional
-
 logger = b4.logger
 
 # Supported diff algorithms we will try to match
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 94b8686..e69a106 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -5,31 +5,31 @@
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
-import os
-import sys
-import b4
-import re
 import argparse
-import uuid
-import time
+import base64
 import datetime
-import json
-import shlex
 import email
 import email.policy
 import email.utils
-import pathlib
-import base64
-import textwrap
 import gzip
+import hashlib
 import io
+import json
+import os
+import pathlib
+import re
+import shlex
+import sys
 import tarfile
-import hashlib
+import textwrap
+import time
 import urllib.parse
-
-from typing import Any, Optional, Tuple, List, Union, Dict, Set
-from string import Template
+import uuid
 from email.message import EmailMessage
+from string import Template
+from typing import Any, Dict, List, Optional, Set, Tuple, Union
+
+import b4
 
 try:
     import patatt
@@ -44,6 +44,7 @@ except ModuleNotFoundError:
     can_gfr = False
 
 import importlib.util
+
 can_codespell = importlib.util.find_spec('codespell_lib') is not None
 
 logger = b4.logger
@@ -216,8 +217,8 @@ def auth_new() -> None:
             sys.exit(1)
         pubkey = out.decode()
     elif algo == 'ed25519':
-        from nacl.signing import SigningKey
         from nacl.encoding import Base64Encoder
+        from nacl.signing import SigningKey
         sk = SigningKey(keydata.encode(), encoder=Base64Encoder)
         pubkey = base64.b64encode(sk.verify_key.encode()).decode()
     else:
diff --git a/src/b4/kr.py b/src/b4/kr.py
index 13f24c7..8bbfe26 100644
--- a/src/b4/kr.py
+++ b/src/b4/kr.py
@@ -7,9 +7,9 @@ __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
 import argparse
 import os
-import sys
 import pathlib
 import re
+import sys
 
 import b4
 
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 2164fcc..624a2f3 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -5,28 +5,26 @@
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
-import os
-import sys
-import mailbox
+import argparse
 import email
-import email.utils
 import email.parser
-import re
-import time
-import json
+import email.utils
 import fnmatch
-import shutil
-import pathlib
 import io
+import json
+import mailbox
+import os
+import pathlib
+import re
 import shlex
-import argparse
-
-import b4
-
-from typing import Any, Optional, Union, List, Set, Dict, Tuple
+import shutil
+import sys
+import time
+from email.message import EmailMessage
 from string import Template
+from typing import Any, Dict, List, Optional, Set, Tuple, Union
 
-from email.message import EmailMessage
+import b4
 
 logger = b4.logger
 
diff --git a/src/b4/pr.py b/src/b4/pr.py
index 5969a0d..cb2ca76 100644
--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -5,26 +5,24 @@
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
-import os
-import sys
-import tempfile
-
-import b4
-import re
-import json
+import argparse
 import email
 import email.message
 import email.parser
 import email.utils
-import argparse
-
+import json
+import os
+import re
+import sys
+import tempfile
 import urllib.parse
-import requests
-
 from datetime import datetime, timezone
+from email import charset, utils
+from typing import List, Optional
 
-from email import utils, charset
-from typing import Optional, List
+import requests
+
+import b4
 
 charset.add_charset('utf-8', None)
 
diff --git a/src/b4/review/__init__.py b/src/b4/review/__init__.py
index 4f64451..df1e39b 100644
--- a/src/b4/review/__init__.py
+++ b/src/b4/review/__init__.py
@@ -1,21 +1,30 @@
 # Re-export everything from the original review module
 from b4.review._review import *  # noqa: F403
 from b4.review._review import (
-    _retrieve_messages, retrieve_series_messages, _get_lore_series,
-    _collect_followups, _collect_reply_headers,
-    _get_my_review, _ensure_my_review, _cleanup_review,
-    _get_patch_state, _set_patch_state,
-    _resolve_comment_positions,
-    _render_quoted_diff_with_comments, _extract_editor_comments,
-    _clear_other_comments, _strip_subject,
-    _build_reply_from_comments, _ensure_trailers_in_body,
+    _build_reply_from_comments,
     _build_review_email,
-    _integrate_agent_reviews,
+    _cleanup_review,
+    _clear_other_comments,
+    _collect_followups,
+    _collect_reply_headers,
+    _ensure_my_review,
+    _ensure_trailers_in_body,
     _extract_comments_from_quoted_reply,
-    _integrate_sashiko_reviews,
+    _extract_editor_comments,
+    _get_lore_series,
+    _get_my_review,
+    _get_patch_state,
+    _integrate_agent_reviews,
     _integrate_followup_inline_comments,
+    _integrate_sashiko_reviews,
     _prepare_review_session,
+    _render_quoted_diff_with_comments,
+    _resolve_comment_positions,
+    _retrieve_messages,
+    _set_patch_state,
     _should_promote_waiting,
+    _strip_subject,
+    retrieve_series_messages,
 )
 
 # Tell mypy these private symbols are intentionally re-exported
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 1234b0f..661369b 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -15,6 +15,7 @@ import re
 import shutil
 import sys
 import urllib.parse
+from typing import Any, Dict, List, Optional, Set, Tuple, Union
 
 import liblore.utils
 
@@ -22,8 +23,6 @@ import b4
 import b4.mbox
 import b4.review.tracking
 
-from typing import Dict, Any, List, Optional, Set, Tuple, Union
-
 logger = b4.logger
 
 REVIEW_MAGIC_MARKER = '--- b4-review-tracking ---'
diff --git a/src/b4/review/checks.py b/src/b4/review/checks.py
index 65ee0ca..2ea5027 100644
--- a/src/b4/review/checks.py
+++ b/src/b4/review/checks.py
@@ -12,7 +12,6 @@ import os
 import pathlib
 import shlex
 import sqlite3
-
 from email.message import EmailMessage
 from typing import Any, Dict, List, Optional, Tuple
 
diff --git a/src/b4/review/messages.py b/src/b4/review/messages.py
index 344d36b..3a0098c 100644
--- a/src/b4/review/messages.py
+++ b/src/b4/review/messages.py
@@ -8,7 +8,6 @@ __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 import os
 import pathlib
 import sqlite3
-
 from typing import Dict, List, Optional
 
 import b4
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index cd966ca..eb80eea 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -13,13 +13,11 @@ import os
 import pathlib
 import sqlite3
 import sys
-
-import liblore
+from typing import Any, Dict, List, Optional, Set, Tuple
 
 import b4
 import b4.mbox
-
-from typing import Any, Dict, List, Optional, Set, Tuple
+import liblore
 
 logger = b4.logger
 
@@ -1129,6 +1127,7 @@ def _store_thread_blob(topdir: str, change_id: str,
     # Local import first — avoids circular deps AND prevents UnboundLocalError
     # that would occur if `import b4.review` appeared after a `b4.xxx` call.
     import io
+
     import b4.review as _b4_review
 
     buf = io.BytesIO()
diff --git a/src/b4/review_tui/__init__.py b/src/b4/review_tui/__init__.py
index 47f3f93..68548e6 100644
--- a/src/b4/review_tui/__init__.py
+++ b/src/b4/review_tui/__init__.py
@@ -1,15 +1,21 @@
 from b4.review_tui._common import (
-    logger, PATCH_STATE_MARKERS,
-    resolve_styles, reviewer_colours,
+    PATCH_STATE_MARKERS,
+    _addrs_to_lines,
+    _lines_to_header,
+    _validate_addrs,
     gather_attestation_info,
-    _addrs_to_lines, _lines_to_header, _validate_addrs,
+    logger,
+    resolve_styles,
+    reviewer_colours,
 )
-from b4.review_tui._review_app import ReviewApp
-from b4.review_tui._tracking_app import TrackingApp
-from b4.review_tui._pw_app import PwApp
 from b4.review_tui._entry import (
-    run_branch_tui, run_pw_tui, run_tracking_tui,
+    run_branch_tui,
+    run_pw_tui,
+    run_tracking_tui,
 )
+from b4.review_tui._pw_app import PwApp
+from b4.review_tui._review_app import ReviewApp
+from b4.review_tui._tracking_app import TrackingApp
 
 __all__ = [
     'logger', 'PATCH_STATE_MARKERS',
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 9c06b32..e819af5 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -12,22 +12,73 @@ import email.utils
 import json
 import os
 import tempfile
-
 from typing import Any, Dict, List, Optional, Set, Tuple
 
 import liblore.utils
+from rich import box
+from rich.padding import Padding
+from rich.panel import Panel
+from rich.rule import Rule
+from rich.text import Text
+from textual.widgets import RichLog
 
 import b4
 import b4.mbox
 import b4.review
 import b4.review.tracking
 
-from textual.widgets import RichLog
-from rich import box
-from rich.padding import Padding
-from rich.panel import Panel
-from rich.rule import Rule
-from rich.text import Text
+# -- Re-exported from b4.tui (canonical home for shared TUI utilities) --------
+from b4.tui._common import (
+    JKListNavMixin as JKListNavMixin,
+)
+from b4.tui._common import (
+    SeparatedFooter as SeparatedFooter,
+)
+from b4.tui._common import (
+    _addrs_to_lines as _addrs_to_lines,
+)
+from b4.tui._common import (
+    _fix_ansi_theme as _fix_ansi_theme,
+)
+from b4.tui._common import (
+    _lines_to_header as _lines_to_header,
+)
+from b4.tui._common import (
+    _quiet_worker as _quiet_worker,
+)
+from b4.tui._common import (
+    _suspend_to_shell as _suspend_to_shell,
+)
+from b4.tui._common import (
+    _to_rich_color as _to_rich_color,
+)
+from b4.tui._common import (
+    _validate_addrs as _validate_addrs,
+)
+from b4.tui._common import (
+    _wait_for_enter as _wait_for_enter,
+)
+from b4.tui._common import (
+    ci_check_styles as ci_check_styles,
+)
+from b4.tui._common import (
+    ci_markup as ci_markup,
+)
+from b4.tui._common import (
+    ci_styles as ci_styles,
+)
+from b4.tui._common import (
+    display_width as display_width,
+)
+from b4.tui._common import (
+    pad_display as pad_display,
+)
+from b4.tui._common import (
+    resolve_styles as resolve_styles,
+)
+from b4.tui._common import (
+    reviewer_colours as reviewer_colours,
+)
 
 logger = b4.logger
 
@@ -75,26 +126,6 @@ CI_CHECK_LABELS = {
 }
 
 
-# -- Re-exported from b4.tui (canonical home for shared TUI utilities) --------
-from b4.tui._common import (
-    JKListNavMixin as JKListNavMixin,
-    SeparatedFooter as SeparatedFooter,
-    _addrs_to_lines as _addrs_to_lines,
-    _fix_ansi_theme as _fix_ansi_theme,
-    _lines_to_header as _lines_to_header,
-    _quiet_worker as _quiet_worker,
-    _suspend_to_shell as _suspend_to_shell,
-    _to_rich_color as _to_rich_color,
-    _validate_addrs as _validate_addrs,
-    _wait_for_enter as _wait_for_enter,
-    ci_check_styles as ci_check_styles,
-    ci_markup as ci_markup,
-    ci_styles as ci_styles,
-    display_width as display_width,
-    pad_display as pad_display,
-    resolve_styles as resolve_styles,
-    reviewer_colours as reviewer_colours,
-)
 
 
 class CheckRunnerMixin:
diff --git a/src/b4/review_tui/_entry.py b/src/b4/review_tui/_entry.py
index 717d1eb..68a48af 100644
--- a/src/b4/review_tui/_entry.py
+++ b/src/b4/review_tui/_entry.py
@@ -10,11 +10,10 @@ from typing import Any, Dict, Optional
 import b4
 import b4.review
 import b4.review.tracking
-
 from b4.review_tui._common import logger
+from b4.review_tui._pw_app import PwApp
 from b4.review_tui._review_app import ReviewApp
 from b4.review_tui._tracking_app import TrackingApp
-from b4.review_tui._pw_app import PwApp
 
 
 def _tui_use_mouse() -> bool:
diff --git a/src/b4/review_tui/_lite_app.py b/src/b4/review_tui/_lite_app.py
index 7474927..7a37e0d 100644
--- a/src/b4/review_tui/_lite_app.py
+++ b/src/b4/review_tui/_lite_app.py
@@ -6,14 +6,10 @@
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
 import email.utils
-
 from dataclasses import dataclass, field
 from typing import Any, Dict, List, Optional
 
-import b4
-import b4.review
-import b4.review.tracking
-
+from rich.text import Text
 from textual.app import ComposeResult
 from textual.binding import Binding
 from textual.containers import Vertical
@@ -21,11 +17,16 @@ from textual.screen import ModalScreen
 from textual.widgets import Label, ListItem, ListView, LoadingIndicator, RichLog, Static
 from textual.worker import Worker, WorkerState
 
-from rich.text import Text
-
+import b4
+import b4.review
+import b4.review.tracking
 from b4.review_tui._common import (
-    resolve_styles, _quiet_worker, _fix_ansi_theme,
-    _write_diff_line, display_width, pad_display,
+    _fix_ansi_theme,
+    _quiet_worker,
+    _write_diff_line,
+    display_width,
+    pad_display,
+    resolve_styles,
 )
 from b4.review_tui._modals import FollowupReplyPreviewScreen
 
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 31b05d3..412419a 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -10,29 +10,50 @@ import email.utils
 import io
 import json
 import re
-
 from typing import Any, Dict, List, Optional, Tuple
 
-import b4
-
+from rich import box
+from rich.panel import Panel
+from rich.rule import Rule
+from rich.text import Text
 from textual.app import ComposeResult
 from textual.binding import Binding
 from textual.containers import Vertical
-from textual.widgets import Checkbox, Input, Label, ListItem, ListView, LoadingIndicator, ProgressBar, RichLog, Select, Static
 from textual.screen import ModalScreen
 from textual.suggester import SuggestFromList
+from textual.widgets import (
+    Checkbox,
+    Input,
+    Label,
+    ListItem,
+    ListView,
+    LoadingIndicator,
+    ProgressBar,
+    RichLog,
+    Select,
+    Static,
+)
 from textual.worker import Worker, WorkerState
-from rich import box
-from rich.panel import Panel
-from rich.rule import Rule
-from rich.text import Text
 
+import b4
 from b4.review_tui._common import (
-    CI_CHECK_LABELS, resolve_styles, ci_check_styles,
-    JKListNavMixin, logger,
-    _write_diff_line, _quiet_worker, _render_email_to_viewer,
+    CI_CHECK_LABELS,
+    JKListNavMixin,
+    _quiet_worker,
+    _render_email_to_viewer,
+    _write_diff_line,
+    ci_check_styles,
+    logger,
+    resolve_styles,
 )
 
+# Re-exported from b4.tui (canonical home for shared modals)
+from b4.tui._modals import ActionItem as ActionItem
+from b4.tui._modals import ActionScreen as ActionScreen
+from b4.tui._modals import ConfirmScreen as ConfirmScreen
+from b4.tui._modals import LimitScreen as LimitScreen
+from b4.tui._modals import ToCcScreen as ToCcScreen
+
 
 class TrailerOption(ListItem):
     """A toggleable trailer option in the trailer selection dialog."""
@@ -540,14 +561,6 @@ class FollowupReplyPreviewScreen(ModalScreen[Optional[str]]):
         self.dismiss(None)
 
 
-# Re-exported from b4.tui (canonical home for shared modals)
-from b4.tui._modals import ToCcScreen as ToCcScreen
-from b4.tui._modals import ConfirmScreen as ConfirmScreen
-from b4.tui._modals import LimitScreen as LimitScreen
-from b4.tui._modals import ActionItem as ActionItem
-from b4.tui._modals import ActionScreen as ActionScreen
-
-
 class SendScreen(ModalScreen[bool]):
     """Modal confirmation screen showing a summary of emails to send."""
 
diff --git a/src/b4/review_tui/_pw_app.py b/src/b4/review_tui/_pw_app.py
index cfc0b11..2b0c10a 100644
--- a/src/b4/review_tui/_pw_app.py
+++ b/src/b4/review_tui/_pw_app.py
@@ -7,24 +7,32 @@ __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
 import json
 import pathlib
-
 from typing import Any, Dict, List, Optional, Set, Tuple
 
-import b4
-import b4.review
-import b4.review.tracking
-
+from rich.text import Text
 from textual.app import App, ComposeResult
 from textual.binding import Binding
 from textual.widgets import Footer, Label, ListItem, ListView, LoadingIndicator, Static
 from textual.worker import Worker, WorkerState
 
-from rich.text import Text
-
-from b4.review_tui._common import resolve_styles, ci_styles, logger, SeparatedFooter, _fix_ansi_theme, pad_display
+import b4
+import b4.review
+import b4.review.tracking
+from b4.review_tui._common import (
+    SeparatedFooter,
+    _fix_ansi_theme,
+    ci_styles,
+    logger,
+    pad_display,
+    resolve_styles,
+)
 from b4.review_tui._modals import (
-    CIChecksScreen, SetStateScreen, ApplyStateModal,
-    LimitScreen, HelpScreen, PW_HELP_LINES,
+    PW_HELP_LINES,
+    ApplyStateModal,
+    CIChecksScreen,
+    HelpScreen,
+    LimitScreen,
+    SetStateScreen,
 )
 
 
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 7807064..51004de 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -10,39 +10,56 @@ import email.utils
 import os
 import re
 import subprocess
-
 from typing import Any, Dict, List, Optional, Set, Tuple
 
-import b4
-import b4.mbox
-import b4.review
-import b4.review.tracking
-
+from rich.rule import Rule
+from rich.syntax import Syntax
+from rich.text import Text
 from textual.app import App, ComposeResult
 from textual.binding import Binding
 from textual.containers import Horizontal, Vertical
 from textual.events import Click
 from textual.widgets import Label, ListItem, ListView, RichLog, Static
-from rich.rule import Rule
-from rich.syntax import Syntax
-from rich.text import Text
 
+import b4
+import b4.mbox
+import b4.review
+import b4.review.tracking
+from b4.review._review import COMMIT_MESSAGE_PATH
 from b4.review_tui._common import (
-    logger, PATCH_STATE_MARKERS,
-    resolve_styles, reviewer_colours, CheckRunnerMixin,
-    _quiet_worker, get_thread_msgs,
-    _has_review_data, _make_initials, _wait_for_enter,
-    _write_comments, _write_followup_comments,
-    _write_followup_trailers, _resolve_patch_for_followup, _chain_has_additional_patch,
-    _get_followup_depth, _render_email_to_viewer,
-    _suspend_to_shell, SeparatedFooter, _fix_ansi_theme,
+    PATCH_STATE_MARKERS,
+    CheckRunnerMixin,
+    SeparatedFooter,
+    _chain_has_additional_patch,
+    _fix_ansi_theme,
+    _get_followup_depth,
+    _has_review_data,
+    _make_initials,
+    _quiet_worker,
+    _render_email_to_viewer,
+    _resolve_patch_for_followup,
+    _suspend_to_shell,
+    _wait_for_enter,
+    _write_comments,
+    _write_followup_comments,
+    _write_followup_trailers,
+    get_thread_msgs,
+    logger,
+    resolve_styles,
+    reviewer_colours,
 )
 from b4.review_tui._modals import (
-    TrailerScreen, HelpScreen, _review_help_lines,
-    NoteScreen, PriorReviewScreen, ToCcScreen, SendScreen,
     FollowupReplyPreviewScreen,
+    HelpScreen,
+    NoteScreen,
+    PriorReviewScreen,
+    SendScreen,
+    ToCcScreen,
+    TrailerScreen,
+    _review_help_lines,
 )
 
+
 class PatchListItem(ListItem):
     """A single entry in the patch list."""
 
@@ -92,7 +109,6 @@ class FollowupItem(ListItem):
 
 
 
-from b4.review._review import COMMIT_MESSAGE_PATH
 
 
 class ReviewApp(CheckRunnerMixin, App[None]):
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 1828bac..2493cda 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -17,15 +17,9 @@ import os
 import pathlib
 import re
 import sqlite3
-
 from string import Template
 from typing import Any, Dict, List, Literal, Optional, Tuple
 
-import b4
-import b4.mbox
-import b4.review
-import b4.review.tracking
-
 from rich.text import Text as RichText
 from textual.app import App, ComposeResult
 from textual.binding import Binding
@@ -33,19 +27,46 @@ from textual.containers import Horizontal, Vertical
 from textual.css.query import NoMatches
 from textual.widgets import Footer, Label, ListItem, ListView, Static
 from textual.worker import Worker, WorkerState
+
+import b4
+import b4.mbox
+import b4.review
+import b4.review.tracking
 from b4.review_tui._common import (
-    logger, resolve_styles, _wait_for_enter, _suspend_to_shell,
-    SeparatedFooter, _quiet_worker, CheckRunnerMixin,
-    _fix_ansi_theme, display_width, pad_display,
+    CheckRunnerMixin,
+    SeparatedFooter,
+    _fix_ansi_theme,
+    _quiet_worker,
+    _suspend_to_shell,
+    _wait_for_enter,
+    display_width,
+    logger,
+    pad_display,
+    resolve_styles,
 )
 from b4.review_tui._modals import (
-    BaseSelectionScreen, WorkerScreen, TakeScreen, TakeConfirmScreen,
-    CherryPickScreen, NewerRevisionWarningScreen,
-    RevisionChoiceScreen, RebaseScreen, TargetBranchScreen,
+    TRACKING_HELP_LINES,
     AbandonConfirmScreen,
-    ArchiveConfirmScreen, RangeDiffScreen, ThankScreen, QueueScreen, QueueDeliveryScreen,
-    LimitScreen, UpdateRevisionScreen, UpdateAllScreen,
-    ActionScreen, HelpScreen, SnoozeScreen, TRACKING_HELP_LINES,
+    ActionScreen,
+    ArchiveConfirmScreen,
+    BaseSelectionScreen,
+    CherryPickScreen,
+    HelpScreen,
+    LimitScreen,
+    NewerRevisionWarningScreen,
+    QueueDeliveryScreen,
+    QueueScreen,
+    RangeDiffScreen,
+    RebaseScreen,
+    RevisionChoiceScreen,
+    SnoozeScreen,
+    TakeConfirmScreen,
+    TakeScreen,
+    TargetBranchScreen,
+    ThankScreen,
+    UpdateAllScreen,
+    UpdateRevisionScreen,
+    WorkerScreen,
 )
 
 # Shortcut keys for the tracking-app action selector.
@@ -3725,6 +3746,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         """
         import tarfile
         import time
+
         import b4.ez
 
         topdir = b4.git_get_toplevel()
@@ -3823,6 +3845,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
     def action_thank(self) -> None:
         """Compose and preview a thank-you reply for a taken series."""
         import argparse
+
         import b4.review
         import b4.ty
 
diff --git a/src/b4/tui/_common.py b/src/b4/tui/_common.py
index f03976d..8eb6c45 100644
--- a/src/b4/tui/_common.py
+++ b/src/b4/tui/_common.py
@@ -11,18 +11,16 @@ import os
 import subprocess
 import tempfile
 import unicodedata
-
-from typing import Any, Dict, List, Optional
-
-import b4
-
 from collections import defaultdict
+from typing import Any, Dict, List, Optional
 
 from textual.app import ComposeResult
 from textual.binding import Binding
 from textual.widgets import Footer, ListView
 from textual.widgets._footer import FooterKey
 
+import b4
+
 logger = b4.logger
 
 
diff --git a/src/b4/tui/_modals.py b/src/b4/tui/_modals.py
index 46025f4..15f2e3b 100644
--- a/src/b4/tui/_modals.py
+++ b/src/b4/tui/_modals.py
@@ -6,7 +6,7 @@
 """Shared modal screens for b4 Textual apps."""
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
-from typing import Dict, List, Optional, Tuple, TYPE_CHECKING
+from typing import TYPE_CHECKING, Dict, List, Optional, Tuple
 
 if TYPE_CHECKING:
     from textual.events import Key
@@ -14,10 +14,15 @@ if TYPE_CHECKING:
 from textual.app import ComposeResult
 from textual.binding import Binding
 from textual.containers import Vertical
-from textual.widgets import Checkbox, Input, Label, ListItem, ListView, Static, TextArea
 from textual.screen import ModalScreen
+from textual.widgets import Checkbox, Input, Label, ListItem, ListView, Static, TextArea
 
-from b4.tui._common import JKListNavMixin, _addrs_to_lines, _lines_to_header, _validate_addrs
+from b4.tui._common import (
+    JKListNavMixin,
+    _addrs_to_lines,
+    _lines_to_header,
+    _validate_addrs,
+)
 
 
 class ToCcScreen(ModalScreen[bool]):
diff --git a/src/b4/ty.py b/src/b4/ty.py
index b429566..5786222 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -5,23 +5,20 @@
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
-import os
-import sys
-
-import b4
-import re
+import argparse
 import email
 import email.parser
 import email.utils
 import json
-import argparse
-
-from string import Template
-from pathlib import Path
-
+import os
+import re
+import sys
 from email.message import EmailMessage
+from pathlib import Path
+from string import Template
+from typing import Any, Callable, Dict, List, Optional, Set, Tuple, Union, cast
 
-from typing import Callable, cast, Optional, Set, Tuple, Union, List, Dict, Any
+import b4
 
 ConfigDictT = b4.ConfigDictT
 JsonDictT = Dict[str, Union[str, int, List[Any], Dict[str, Any]]]
diff --git a/src/tests/conftest.py b/src/tests/conftest.py
index f42ade4..d8cd853 100644
--- a/src/tests/conftest.py
+++ b/src/tests/conftest.py
@@ -1,11 +1,12 @@
-import pytest
-import b4
 import os
 import pathlib
 import sys
-
 from typing import Generator
 
+import pytest
+
+import b4
+
 
 @pytest.fixture(scope="function", autouse=True)
 def settestdefaults(tmp_path: pathlib.Path) -> None:
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 362643a..faf5c96 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1,14 +1,15 @@
-import pytest
-import b4
-import os
 import email
 import email.parser
 import io
+import os
 import pathlib
 import socket
-
 from typing import Any, Dict, List, Literal, Optional, Tuple
 
+import pytest
+
+import b4
+
 
 @pytest.mark.parametrize('source,expected', [
     ('good-valid-trusted', (True, True, True, 'B6C41CE35664996C', '1623274836')),
@@ -679,8 +680,9 @@ class TestGetLoreNode:
 
     def test_uses_from_git_config(self, monkeypatch: pytest.MonkeyPatch) -> None:
         """get_lore_node() constructs via LoreNode.from_git_config()."""
-        import liblore
         from unittest.mock import MagicMock
+
+        import liblore
         mock_node = MagicMock()
         mock_from_gc = MagicMock(return_value=mock_node)
         monkeypatch.setattr(liblore.LoreNode, 'from_git_config', mock_from_gc)
@@ -690,8 +692,9 @@ class TestGetLoreNode:
 
     def test_sets_user_agent(self, monkeypatch: pytest.MonkeyPatch) -> None:
         """get_lore_node() calls set_user_agent with b4's identity."""
-        import liblore
         from unittest.mock import MagicMock
+
+        import liblore
         mock_node = MagicMock()
         monkeypatch.setattr(liblore.LoreNode, 'from_git_config', MagicMock(return_value=mock_node))
         b4.get_lore_node()
@@ -699,8 +702,9 @@ class TestGetLoreNode:
 
     def test_does_not_inject_session(self, monkeypatch: pytest.MonkeyPatch) -> None:
         """get_lore_node() lets liblore own its session."""
-        import liblore
         from unittest.mock import MagicMock
+
+        import liblore
         mock_node = MagicMock()
         monkeypatch.setattr(liblore.LoreNode, 'from_git_config', MagicMock(return_value=mock_node))
         b4.get_lore_node()
@@ -708,8 +712,9 @@ class TestGetLoreNode:
 
     def test_passes_cache_settings(self, monkeypatch: pytest.MonkeyPatch) -> None:
         """cache_dir and cache_ttl from b4 config are passed through."""
-        import liblore
         from unittest.mock import MagicMock
+
+        import liblore
         b4.MAIN_CONFIG['cache-expire'] = '5'
         mock_node = MagicMock()
         mock_from_gc = MagicMock(return_value=mock_node)
@@ -721,8 +726,9 @@ class TestGetLoreNode:
 
     def test_singleton(self, monkeypatch: pytest.MonkeyPatch) -> None:
         """Repeated calls return the same LoreNode instance."""
-        import liblore
         from unittest.mock import MagicMock
+
+        import liblore
         mock_node = MagicMock()
         mock_from_gc = MagicMock(return_value=mock_node)
         monkeypatch.setattr(liblore.LoreNode, 'from_git_config', mock_from_gc)
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 7e67a0b..ef21985 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -1,12 +1,13 @@
-import pytest
 import os
+from typing import Any, Dict, Generator, List, Optional, Tuple
+from unittest.mock import MagicMock, patch
+
+import pytest
+
 import b4
+import b4.command
 import b4.ez
 import b4.mbox
-import b4.command
-
-from typing import Any, Dict, Generator, List, Optional, Tuple
-from unittest.mock import MagicMock, patch
 
 
 @pytest.fixture(scope="function")
diff --git a/src/tests/test_mbox.py b/src/tests/test_mbox.py
index b3c0536..b533421 100644
--- a/src/tests/test_mbox.py
+++ b/src/tests/test_mbox.py
@@ -1,13 +1,14 @@
-import pytest
 import os
-import b4
-import b4.mbox
-import b4.command
-
 from email.message import EmailMessage
 from typing import Any, Dict, List
 from unittest.mock import patch as mock_patch
 
+import pytest
+
+import b4
+import b4.command
+import b4.mbox
+
 
 @pytest.mark.parametrize('mboxf, shazamargs, compareargs, compareout, b4cfg', [
     ('shazam-git1-just-series', [],
diff --git a/src/tests/test_patatt.py b/src/tests/test_patatt.py
index 592d546..c257d41 100644
--- a/src/tests/test_patatt.py
+++ b/src/tests/test_patatt.py
@@ -10,12 +10,11 @@ from collections.abc import Generator
 from typing import Tuple, Union
 
 import pytest
+from nacl.signing import SigningKey
 
 import b4
 import patatt
 
-from nacl.signing import SigningKey
-
 
 @pytest.fixture()
 def ed25519_keypair() -> Generator[Tuple[str, str, str, str], None, None]:
diff --git a/src/tests/test_rethread.py b/src/tests/test_rethread.py
index 1cf5239..f2a0394 100644
--- a/src/tests/test_rethread.py
+++ b/src/tests/test_rethread.py
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
-import b4
 import email.message
+from typing import List, Optional, Tuple
 from unittest import mock
 
-from typing import List, Optional, Tuple
+import b4
 
 
 # ---------------------------------------------------------------------------
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index 1523618..92ebe57 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -6,11 +6,9 @@ from unittest import mock
 import pytest
 
 import b4
-from b4 import review
-from b4 import review_tui
+from b4 import review, review_tui
 from b4.review._review import REVIEW_MAGIC_MARKER, check_series_attestation
 
-
 # -- Helper diffs used across tests ------------------------------------------
 
 # A minimal single-file, single-hunk diff
@@ -140,7 +138,7 @@ class TestRenderQuotedDiffWithComments:
         # First non-empty line should be an instruction
         assert lines[0].startswith('# ')
         # Instructions end before the first quoted diff line
-        instruction_lines = [l for l in lines if l.startswith('#')]
+        instruction_lines = [line for line in lines if line.startswith('#')]
         assert len(instruction_lines) >= 3
         # _extract_editor_comments should strip them
         comments = review._extract_editor_comments(result)
@@ -157,7 +155,7 @@ class TestRenderQuotedDiffWithComments:
         assert '> Second line.' in lines
         # They should come before the diff
         body_idx = lines.index('> This is the body.')
-        diff_idx = next(i for i, l in enumerate(lines) if 'diff --git' in l)
+        diff_idx = next(i for i, line in enumerate(lines) if 'diff --git' in line)
         assert body_idx < diff_idx
 
     def test_commit_msg_own_comment(self) -> None:
@@ -213,7 +211,7 @@ class TestRenderQuotedDiffWithComments:
         lines = result.splitlines()
         assert 'General note' in lines
         note_idx = lines.index('General note')
-        body_idx = next(i for i, l in enumerate(lines) if 'First body line' in l)
+        body_idx = next(i for i, line in enumerate(lines) if 'First body line' in line)
         assert note_idx < body_idx
 
 
@@ -583,7 +581,7 @@ index abc..def 100644
         assert 'General feedback.' in lines
         # Preamble should come before any quoted line
         feedback_idx = lines.index('General feedback.')
-        quoted_lines = [i for i, l in enumerate(lines) if l.startswith('>')]
+        quoted_lines = [i for i, line in enumerate(lines) if line.startswith('>')]
         if quoted_lines:
             assert feedback_idx < quoted_lines[0]
 
diff --git a/src/tests/test_review_checks.py b/src/tests/test_review_checks.py
index 7d737ad..c866082 100644
--- a/src/tests/test_review_checks.py
+++ b/src/tests/test_review_checks.py
@@ -9,7 +9,6 @@ import pytest
 
 from b4.review import checks
 
-
 # ---------------------------------------------------------------------------
 # Helpers
 # ---------------------------------------------------------------------------
diff --git a/src/tests/test_review_show_info.py b/src/tests/test_review_show_info.py
index abfbf3c..db955c4 100644
--- a/src/tests/test_review_show_info.py
+++ b/src/tests/test_review_show_info.py
@@ -5,18 +5,17 @@
 #
 """Tests for ``b4 review show-info``."""
 import json
-import pytest
 
+import pytest
 
 import b4
 import b4.review
 from b4.review._review import (
     get_review_info,
-    show_review_info,
     list_review_branches,
+    show_review_info,
 )
 
-
 # ---------------------------------------------------------------------------
 # Helpers
 # ---------------------------------------------------------------------------
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 8cc0c70..a5fd903 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -12,8 +12,8 @@ import pytest
 import b4
 import b4.review
 from b4.review import tracking as review_tracking
-from b4.review_tui._tracking_app import _format_snooze_until, _format_attestation
 from b4.review_tui._modals import SnoozeScreen
+from b4.review_tui._tracking_app import _format_attestation, _format_snooze_until
 
 
 class TestGetReviewDataDir:
@@ -1820,14 +1820,14 @@ class TestBuildReplyFromComments:
 
     def _skip_markers(self, lines: list[str]) -> list[str]:
         """Return all skip-marker lines from the output."""
-        return [l for l in lines if l.startswith('> [ ... skip')]
+        return [line for line in lines if line.startswith('> [ ... skip')]
 
     def test_short_hunk_no_skip_marker(self) -> None:
         """Comment within 5 lines of hunk start → no skip marker of any kind."""
         lines = self._call([self._make_comment(3, 'nice')])
         assert not self._skip_markers(lines)
         # @@ header always present
-        assert any('@@ -0,0 +1,40 @@' in l for l in lines)
+        assert any('@@ -0,0 +1,40 @@' in line for line in lines)
         # All 3 added lines quoted
         assert '> +line1' in lines
         assert '> +line2' in lines
@@ -1852,7 +1852,7 @@ class TestBuildReplyFromComments:
         assert len(markers) == 1
         assert 'skip 14 lines' in markers[0]
         # @@ header present
-        assert any('@@ -0,0 +1,40 @@' in l for l in lines)
+        assert any('@@ -0,0 +1,40 @@' in line for line in lines)
         # Only lines 15-20 quoted (5 context + the commented line)
         assert '> +line15' in lines
         assert '> +line20' in lines
@@ -1903,7 +1903,7 @@ class TestBuildReplyFromComments:
     def test_hunk_header_always_present(self) -> None:
         """The @@ hunk header is always included even for a comment on line 20."""
         lines = self._call([self._make_comment(20, 'end')])
-        assert any('@@ -0,0 +1,40 @@' in l for l in lines)
+        assert any('@@ -0,0 +1,40 @@' in line for line in lines)
         assert self._skip_markers(lines)
         assert '> +line20' in lines
         assert '> +line14' not in lines
@@ -1915,7 +1915,7 @@ class TestBuildReplyFromComments:
             self._make_comment(10, 'y'),
         ]
         lines = self._call(comments)
-        quoted = [l for l in lines if l.startswith('> +')]
+        quoted = [line for line in lines if line.startswith('> +')]
         # Each quoted diff line should appear exactly once
         assert len(quoted) == len(set(quoted))
 
diff --git a/src/tests/test_three_way_merge.py b/src/tests/test_three_way_merge.py
index 83a4c77..c0127bf 100644
--- a/src/tests/test_three_way_merge.py
+++ b/src/tests/test_three_way_merge.py
@@ -1,13 +1,14 @@
 import argparse
 import json
 import os
+from typing import Any, Dict, Optional, Tuple
+from unittest.mock import patch
+
 import pytest
+
 import b4
 import b4.mbox
 
-from typing import Any, Dict, Optional, Tuple
-from unittest.mock import patch
-
 
 class TestAmConflictError:
     """Tests for the AmConflictError exception class."""
diff --git a/src/tests/test_tui_bugs.py b/src/tests/test_tui_bugs.py
index 19f073c..4cab381 100644
--- a/src/tests/test_tui_bugs.py
+++ b/src/tests/test_tui_bugs.py
@@ -12,8 +12,6 @@ from datetime import datetime, timezone
 from typing import Set
 from unittest import mock
 
-from ezgb import Bug, BugSummary, Comment, Identity, Status
-
 from b4.bugs._import import (
     format_comment,
     is_comment_removed,
@@ -29,7 +27,7 @@ from b4.bugs._tui import (
     _relative_time,
     label_color,
 )
-
+from ezgb import Bug, BugSummary, Comment, Identity, Status
 
 # ---------------------------------------------------------------------------
 # Helpers -- factory functions for real Bug and BugSummary objects
diff --git a/src/tests/test_tui_modals.py b/src/tests/test_tui_modals.py
index 7b123cc..e0e6f3f 100644
--- a/src/tests/test_tui_modals.py
+++ b/src/tests/test_tui_modals.py
@@ -9,14 +9,14 @@ Uses Textual's built-in ``App.run_test()`` / ``Pilot`` harness so the
 tests run without a real terminal.  Only lightweight, self-contained
 modals are exercised here — no database, network, or git needed.
 """
-import pytest
-
 from typing import Any, Dict, List, Optional, Tuple
 
+import pytest
 from textual.app import App, ComposeResult
 from textual.widgets import Input, Label, ListView
 
 from b4.review_tui._modals import (
+    TRACKING_HELP_LINES,
     ActionScreen,
     ConfirmScreen,
     HelpScreen,
@@ -28,10 +28,8 @@ from b4.review_tui._modals import (
     SnoozeScreen,
     TrailerScreen,
     UpdateRevisionScreen,
-    TRACKING_HELP_LINES,
 )
 
-
 # ---------------------------------------------------------------------------
 # Compat helper — Textual ≥ 1.0 (pip) uses Static.content,
 # older builds (e.g. Fedora 43 package) still use Static.renderable.
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index c3a2db4..3222989 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -8,16 +8,14 @@
 Tests the shell-return reconciliation logic that detects and handles
 cosmetic commit edits (e.g. reworded subjects via git rebase -i).
 """
-import pytest
-
 from typing import Any, Dict, List, Tuple
 
+import pytest
+
 import b4
 import b4.review
-
 from b4.review_tui._review_app import ReviewApp
 
-
 # ---------------------------------------------------------------------------
 # Helpers
 # ---------------------------------------------------------------------------
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 96b160a..80004e8 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -11,28 +11,25 @@ core user workflows: series listing, navigation, filtering,
 status transitions, and modal interactions.
 """
 import pathlib
-import pytest
-
 from typing import Any, Dict, List, Optional
 from unittest.mock import patch
 
+import pytest
+from textual.widgets import Input, ListView, Static
+
 import b4
 import b4.review
 import b4.review.tracking as tracking
-
-from textual.widgets import Input, ListView, Static
-
-from b4.review_tui._tracking_app import TrackingApp, TrackedSeriesItem
 from b4.review_tui._modals import (
-    ActionScreen,
     ActionItem,
+    ActionScreen,
     ConfirmScreen,
     HelpScreen,
     LimitScreen,
     SnoozeScreen,
     TargetBranchScreen,
 )
-
+from b4.review_tui._tracking_app import TrackedSeriesItem, TrackingApp
 
 # ---------------------------------------------------------------------------
 # Compat helper — Textual ≥ 1.0 (pip) uses Static.content,

-- 
2.53.0


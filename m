Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870783C6A56
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580523; cv=none; b=kOuKLkZFikG6xI1QguIIluGR5GyUFtvp8JuXrc5GUiUoBOfEHyhGPcQg7yoviAqIEJNmIHXTg6IRN6erIGqJUWmub+jpuJe47PJ81BDXQ2U0NWksL1nU7+m5cJxYn8Yu3F2Z5fF008AsTZoqRsZmPU5miZNJNb4a8igFNAEaX4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580523; c=relaxed/simple;
	bh=b7diakBPtYHhZKxNEqpciCePQEar6DvT9C0zwkU7Fl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Egmkh/OSv4WbbsWQoAm1G/s2/72pySwZxqgQvpBz6OTZ2ht6qvrY4KgRT4Ik6VDP03xPq50ShVSQ0+I6kHmElSztwu+70FjAu73HRKM3xtXnUJKeUtlKyWqxWFJ5PcE90l9O7dpPl5dtZh7nMuYD92kfrcB12F/Zq3lP0GuccFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osEsPOGQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osEsPOGQ"
Received: by smtp.kernel.org (Postfix)
	id 73ABCC116C6; Tue,  7 Apr 2026 16:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CEEC19424;
	Tue,  7 Apr 2026 16:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580523;
	bh=b7diakBPtYHhZKxNEqpciCePQEar6DvT9C0zwkU7Fl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=osEsPOGQIH1FuYNL1wvidjxkESYgoM875ypHlxbh8wAXAcUFwm3m64uS9UoWCZ7ae
	 AVfQoQlqgEMyJi3C9WeaxQWaw5NM0TGNfiz7XdPGReeau/dwKEYojV37Z/kIjrs3qf
	 ONSO0StuxO6g/b//bgq2avztmbBgPiBISMDKQpa15iOnXj8As4dmYARGCXXx6XgAFY
	 Au/ZVY1b93aWe9vaiMlnSat7ouNSKdzKkSAinV/dcIMGHo+7THF5bo4XOvCLsiogqu
	 MLt/BubntUy747ZGHFkBmvvMcw7WDysnyUyJ2xwa+ew5KGlStuGGgJ5B7vlf99dept
	 pgkzhqX4sA32g==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:32 -0400
Subject: [PATCH b4 03/12] Use ruff to sort imports
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-ruff-check-v1-3-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=42914; i=tamird@kernel.org;
 h=from:subject:message-id; bh=b7diakBPtYHhZKxNEqpciCePQEar6DvT9C0zwkU7Fl8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTdM/1do2Oy+u65+SM8flpYHQd+WEYy8T+0vPGinOn
 3/3qVFXx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKm29mT4K+5vajznWOv/c/w99yu+P7TUW9Qf/NBv7i5RvlezH86buZThr6SS7vV
 5rdxXRHNfPtjaVfy7+qxduWqpEf+213Zblu1VYwAA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

All edits apart from pyproject.toml made by `ruff check --fix`.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 misc/send-receive.py               | 30 +++++++++---------
 pyproject.toml                     |  1 +
 src/b4/__init__.py                 | 65 ++++++++++++++++++++++----------------
 src/b4/bugs/__init__.py            |  8 ++---
 src/b4/bugs/_import.py             |  3 +-
 src/b4/bugs/_tui.py                |  9 +++---
 src/b4/command.py                  |  4 +--
 src/b4/diff.py                     | 16 +++++-----
 src/b4/dig.py                      | 13 ++++----
 src/b4/ez.py                       | 33 +++++++++----------
 src/b4/kr.py                       |  2 +-
 src/b4/mbox.py                     | 28 ++++++++--------
 src/b4/pr.py                       | 24 +++++++-------
 src/b4/review/__init__.py          | 29 +++++++++++------
 src/b4/review/_review.py           |  3 +-
 src/b4/review/checks.py            |  1 -
 src/b4/review/messages.py          |  1 -
 src/b4/review/tracking.py          |  4 +--
 src/b4/review_tui/__init__.py      | 20 ++++++++----
 src/b4/review_tui/_common.py       | 45 ++++++++++++++++++++++----
 src/b4/review_tui/_entry.py        |  3 +-
 src/b4/review_tui/_lite_app.py     | 19 +++++------
 src/b4/review_tui/_modals.py       | 42 ++++++++++++++++--------
 src/b4/review_tui/_pw_app.py       | 28 ++++++++++------
 src/b4/review_tui/_review_app.py   | 53 ++++++++++++++++++++-----------
 src/b4/review_tui/_tracking_app.py | 53 ++++++++++++++++++++++---------
 src/b4/tui/_common.py              |  8 ++---
 src/b4/tui/_modals.py              | 11 +++++--
 src/b4/ty.py                       | 19 +++++------
 src/tests/conftest.py              |  7 ++--
 src/tests/test___init__.py         |  9 +++---
 src/tests/test_ez.py               | 11 ++++---
 src/tests/test_mbox.py             | 11 ++++---
 src/tests/test_patatt.py           |  3 +-
 src/tests/test_rethread.py         |  4 +--
 src/tests/test_review.py           |  4 +--
 src/tests/test_review_checks.py    |  1 -
 src/tests/test_review_show_info.py |  5 ++-
 src/tests/test_review_tracking.py  |  2 +-
 src/tests/test_three_way_merge.py  |  7 ++--
 src/tests/test_tui_bugs.py         |  1 -
 src/tests/test_tui_modals.py       |  6 ++--
 src/tests/test_tui_review.py       |  6 ++--
 src/tests/test_tui_tracking.py     | 13 +++-----
 44 files changed, 384 insertions(+), 281 deletions(-)

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
index a324583..4fad7da 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -91,6 +91,7 @@ select = [
     "B904",    # https://docs.astral.sh/ruff/rules/raise-without-from-err/
     "DTZ",     # https://docs.astral.sh/ruff/rules/#flake8-datetimez-dtz
     "G",       # https://docs.astral.sh/ruff/rules/#flake8-logging-format-g
+    "I",       # https://docs.astral.sh/ruff/rules/#isort-i
     "PERF102", # https://docs.astral.sh/ruff/rules/incorrect-dict-iterator/
     "PGH004",  # https://docs.astral.sh/ruff/rules/blanket-noqa/
     "PIE790",  # https://docs.astral.sh/ruff/rules/unnecessary-placeholder/
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a298c1d..7cc3a93 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1,48 +1,59 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
-import subprocess
-import logging
-import hashlib
-import re
-import sys
-import gzip
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
+import gzip
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
 
 import requests
 
-from pathlib import Path
-from contextlib import contextmanager
-from typing import Optional, Tuple, Set, List, BinaryIO, Union, Sequence, Literal, Iterator, Dict, \
-    TypeVar, overload, Generator, Any
-
 ConfigDictT = Dict[str, Union[str, List[str], None]]
 
-from email.message import EmailMessage
-
 from email import charset
+from email.message import EmailMessage
 
 charset.add_charset('utf-8', None)
 # Policy we use for saving mail locally
diff --git a/src/b4/bugs/__init__.py b/src/b4/bugs/__init__.py
index dd28b5a..e48424a 100644
--- a/src/b4/bugs/__init__.py
+++ b/src/b4/bugs/__init__.py
@@ -4,16 +4,16 @@
 # Copyright (C) 2020 by the Linux Foundation
 """b4 bugs: manage bug reports from mailing list threads."""
 import argparse
-import logging
-import sys
-
 import json
+import logging
 import shutil
+import sys
 
-import b4
 from ezgb import BugNotFoundError, GitBugRepo, Status
 from ezgb._git import git_bug_cli
 
+import b4
+
 logger = logging.getLogger('b4')
 
 
diff --git a/src/b4/bugs/_import.py b/src/b4/bugs/_import.py
index 954ebec..3b05037 100644
--- a/src/b4/bugs/_import.py
+++ b/src/b4/bugs/_import.py
@@ -9,9 +9,10 @@ import re
 from email.message import EmailMessage
 from typing import Optional
 
+from ezgb import Bug, GitBugRepo
+
 import b4
 import b4.mbox
-from ezgb import Bug, GitBugRepo
 
 logger = logging.getLogger('b4')
 
diff --git a/src/b4/bugs/_tui.py b/src/b4/bugs/_tui.py
index aa59cea..eae7f88 100644
--- a/src/b4/bugs/_tui.py
+++ b/src/b4/bugs/_tui.py
@@ -14,14 +14,14 @@ from typing import TYPE_CHECKING, Optional, Union
 if TYPE_CHECKING:
     from textual.events import Key
 
-from textual.events import Click, MouseScrollDown, MouseScrollUp
-
+from ezgb import Bug, BugSummary, Comment, GitBugRepo, Status
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
@@ -34,6 +34,8 @@ from textual.widgets import (
 )
 from textual.worker import Worker, WorkerState
 
+import b4
+from b4.bugs._import import is_comment_removed, make_tombstone, parse_comment_header
 from b4.tui import (
     ActionScreen,
     ConfirmScreen,
@@ -47,9 +49,6 @@ from b4.tui import (
     resolve_styles,
     reviewer_colours,
 )
-import b4
-from b4.bugs._import import is_comment_removed, make_tombstone, parse_comment_header
-from ezgb import Bug, BugSummary, Comment, GitBugRepo, Status
 
 # Union type for items that can appear in the bug list.
 # BugSummary is used for the fast initial load; full Bug on demand.
diff --git a/src/b4/command.py b/src/b4/command.py
index 5e85bdf..a70a986 100644
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
index dbbf4b5..3d5490b 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -15,13 +15,12 @@ import re
 import shutil
 import sys
 import urllib.parse
+from typing import Any, Dict, List, Optional, Set, Tuple, Union
 
 import b4
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
index 76287e2..e66cfd8 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -15,12 +15,11 @@ import pathlib
 import sqlite3
 import sys
 import urllib.parse
+from typing import Any, Dict, List, Optional, Set, Tuple
 
 import b4
 import b4.mbox
 
-from typing import Any, Dict, List, Optional, Set, Tuple
-
 logger = b4.logger
 
 REVIEW_METADATA_DIR = 'b4-review'
@@ -1170,6 +1169,7 @@ def _store_thread_blob(topdir: str, change_id: str,
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
index e0bce08..f30405d 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -12,20 +12,19 @@ import email.utils
 import json
 import os
 import tempfile
-
 from typing import Any, Dict, List, Optional, Set, Tuple
 
-import b4
-import b4.mbox
-import b4.review
-import b4.review.tracking
-
-from textual.widgets import RichLog
 from rich import box
 from rich.padding import Padding
 from rich.panel import Panel
 from rich.rule import Rule
 from rich.text import Text
+from textual.widgets import RichLog
+
+import b4
+import b4.mbox
+import b4.review
+import b4.review.tracking
 
 logger = b4.logger
 
@@ -78,21 +77,53 @@ CI_CHECK_LABELS = {
 # -- Re-exported from b4.tui (canonical home for shared TUI utilities) --------
 from b4.tui._common import (
     JKListNavMixin as JKListNavMixin,
+)
+from b4.tui._common import (
     SeparatedFooter as SeparatedFooter,
+)
+from b4.tui._common import (
     _addrs_to_lines as _addrs_to_lines,
+)
+from b4.tui._common import (
     _fix_ansi_theme as _fix_ansi_theme,
+)
+from b4.tui._common import (
     _lines_to_header as _lines_to_header,
+)
+from b4.tui._common import (
     _quiet_worker as _quiet_worker,
+)
+from b4.tui._common import (
     _suspend_to_shell as _suspend_to_shell,
+)
+from b4.tui._common import (
     _to_rich_color as _to_rich_color,
+)
+from b4.tui._common import (
     _validate_addrs as _validate_addrs,
+)
+from b4.tui._common import (
     _wait_for_enter as _wait_for_enter,
+)
+from b4.tui._common import (
     ci_check_styles as ci_check_styles,
+)
+from b4.tui._common import (
     ci_markup as ci_markup,
+)
+from b4.tui._common import (
     ci_styles as ci_styles,
+)
+from b4.tui._common import (
     display_width as display_width,
+)
+from b4.tui._common import (
     pad_display as pad_display,
+)
+from b4.tui._common import (
     resolve_styles as resolve_styles,
+)
+from b4.tui._common import (
     reviewer_colours as reviewer_colours,
 )
 
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
index 89e946e..10bffb5 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -10,27 +10,41 @@ import email.utils
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
 
 
@@ -541,11 +555,11 @@ class FollowupReplyPreviewScreen(ModalScreen[Optional[str]]):
 
 
 # Re-exported from b4.tui (canonical home for shared modals)
-from b4.tui._modals import ToCcScreen as ToCcScreen
-from b4.tui._modals import ConfirmScreen as ConfirmScreen
-from b4.tui._modals import LimitScreen as LimitScreen
 from b4.tui._modals import ActionItem as ActionItem
 from b4.tui._modals import ActionScreen as ActionScreen
+from b4.tui._modals import ConfirmScreen as ConfirmScreen
+from b4.tui._modals import LimitScreen as LimitScreen
+from b4.tui._modals import ToCcScreen as ToCcScreen
 
 
 class SendScreen(ModalScreen[bool]):
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
index 3ae3c1a..c6c926d 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -10,39 +10,54 @@ import email.utils
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
 from b4.review_tui._common import (
-    logger, PATCH_STATE_MARKERS,
-    resolve_styles, reviewer_colours, CheckRunnerMixin,
-    _quiet_worker, get_thread_msgs,
-    _has_review_data, _make_initials, _wait_for_enter,
-    _write_comments, _write_followup_comments,
-    _write_followup_trailers, _resolve_patch_for_followup,
-    _get_followup_depth, _render_email_to_viewer,
-    _suspend_to_shell, SeparatedFooter, _fix_ansi_theme,
+    PATCH_STATE_MARKERS,
+    CheckRunnerMixin,
+    SeparatedFooter,
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
 
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 1499aa8..99de823 100644
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
@@ -3708,6 +3729,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
         """
         import tarfile
         import time
+
         import b4.ez
 
         topdir = b4.git_get_toplevel()
@@ -3806,6 +3828,7 @@ class TrackingApp(CheckRunnerMixin, App[Optional[str]]):
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
index 755938a..cb01795 100644
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
index d0853cc..a0513a3 100644
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
index 9eb2e98..181b5e5 100644
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
index 19f073c..db900fd 100644
--- a/src/tests/test_tui_bugs.py
+++ b/src/tests/test_tui_bugs.py
@@ -30,7 +30,6 @@ from b4.bugs._tui import (
     label_color,
 )
 
-
 # ---------------------------------------------------------------------------
 # Helpers -- factory functions for real Bug and BugSummary objects
 # ---------------------------------------------------------------------------
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


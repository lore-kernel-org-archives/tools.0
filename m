Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D323C0603
	for <tools@linux.kernel.org>; Wed, 16 Sep 2026 06:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541799; cv=none; b=mrsPwOBPE4Dw3oRI8T0UHsZoDfQHIjVO9yUTUYc/rfn8jXjKLsbghGeXGzMfRo3YJq1wCo9zkSXHuM7to06RZt9sELC6JfbtRcQ+q+hdtoOu06IFEjhvAjVb9jes7AvChcTltBye/JneWwDmCdQW4e4tqozyN4HujGrupUTZuXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541799; c=relaxed/simple;
	bh=JIYSwb+uNBSGmm4vZVpArgEqz1tI8BPNvfl0b4FB7Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r2Qdef13vOGvSK3Xpq8r4rVDkxwPeVTbemvhogL8+Nj5lS3PijFdx3DSj3cwwlmelTmtXmZs2VapCzadMJq84g9lo0bWjx7MuAmQks4x2jK9k4fHBEsH8CkVSpJRYeoqNCIy4AB8VUZP9H0jsB80XSuJR83b8Xmp9noM9OJrsdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfaYPSna; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfaYPSna"
Received: by smtp.kernel.org (Postfix)
	id A35151F00893; Wed, 16 Sep 2026 06:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B6F1F000FF;
	Wed, 16 Sep 2026 06:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789541797;
	bh=zdWBWolPMOnnX0u5l4jR6pyKUPpYfqmQ2VBW14AGBn0=;
	h=From:To:Cc:Subject:Date;
	b=AfaYPSnay6JyeZBXCUxEDS6H3RzGZrzxLid/lSgJzCeg/JeYc+b728YyETPCKb6lo
	 XgG07fhPSXKETpJsmZydvlbF+MOjlmO+H3Zlqlow8XzeZqGT4YLGtTjtiU5Ac+fbPj
	 sTazjtvfhDZofuvKN0oe2t1JSLi4z0g5erBDcentAq2FvmkwMVtsq0s1dQDZuBdAQg
	 17TfERvXs1nYjcmLHpmaum40FyTX/scYFi05Y+PNWQFhotgxcGI9Umv8PWg5QAMriy
	 9df0SE0ywxkiWXs69SdWOWgDbMDfKSh66HgUYpt44mZvGope9/HHydIXFwnNTcINgB
	 MYlixVCIaewMQ==
From: Maxime Ripard <mripard@kernel.org>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <mricon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] b4: Drop shebang lines from library modules
Date: Wed, 16 Sep 2026 08:56:32 +0200
Message-ID: <20260916065632.2359054-1-mripard@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpmlint reports non-executable-script errors on several Python modules.
These files are installed as regular library modules with 0644
permissions, so the shebang line is unnecessary and triggers the
diagnostic.

Remove the shebang from all modules.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 src/b4/_rewrite.py                 | 1 -
 src/b4/bugs/__init__.py            | 1 -
 src/b4/bugs/_import.py             | 1 -
 src/b4/bugs/_tui.py                | 1 -
 src/b4/command.py                  | 1 -
 src/b4/diff.py                     | 1 -
 src/b4/dig.py                      | 1 -
 src/b4/ez.py                       | 1 -
 src/b4/kr.py                       | 1 -
 src/b4/mbox.py                     | 1 -
 src/b4/pr.py                       | 1 -
 src/b4/review/_review.py           | 1 -
 src/b4/review/checks.py            | 1 -
 src/b4/review/messages.py          | 1 -
 src/b4/review/tracking.py          | 1 -
 src/b4/review_tui/_common.py       | 1 -
 src/b4/review_tui/_entry.py        | 1 -
 src/b4/review_tui/_lite_app.py     | 1 -
 src/b4/review_tui/_modals.py       | 1 -
 src/b4/review_tui/_pw_app.py       | 1 -
 src/b4/review_tui/_review_app.py   | 1 -
 src/b4/review_tui/_tracking_app.py | 1 -
 src/b4/tui/_common.py              | 1 -
 src/b4/tui/_modals.py              | 1 -
 src/b4/ty.py                       | 1 -
 25 files changed, 25 deletions(-)

diff --git a/src/b4/_rewrite.py b/src/b4/_rewrite.py
index f3464485cce1..a0c6ab5d79f9 100644
--- a/src/b4/_rewrite.py
+++ b/src/b4/_rewrite.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 #
 """Native history rewriting for b4, backed by pygit2.
diff --git a/src/b4/bugs/__init__.py b/src/b4/bugs/__init__.py
index 0640ea5ad806..57d1b2882e44 100644
--- a/src/b4/bugs/__init__.py
+++ b/src/b4/bugs/__init__.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 """b4 bugs: manage bug reports from mailing list threads."""
 
diff --git a/src/b4/bugs/_import.py b/src/b4/bugs/_import.py
index 9114f70ce94d..1c1ee7e50b60 100644
--- a/src/b4/bugs/_import.py
+++ b/src/b4/bugs/_import.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 """Thread import engine: lore.kernel.org -> git-bug via ezgb."""
 
diff --git a/src/b4/bugs/_tui.py b/src/b4/bugs/_tui.py
index 39afd6e774ea..52c392af28b2 100644
--- a/src/b4/bugs/_tui.py
+++ b/src/b4/bugs/_tui.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 """Textual TUI for b4 bugs."""
 
diff --git a/src/b4/command.py b/src/b4/command.py
index 6c51e28357dc..2d9a5b88d2c7 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # PYTHON_ARGCOMPLETE_OK
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 #
diff --git a/src/b4/diff.py b/src/b4/diff.py
index 73920560320f..64f4fece7d4c 100644
--- a/src/b4/diff.py
+++ b/src/b4/diff.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/dig.py b/src/b4/dig.py
index 24e15ff5f974..deaaa684ff6c 100644
--- a/src/b4/dig.py
+++ b/src/b4/dig.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2025 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/ez.py b/src/b4/ez.py
index cf0029ce7bba..a9e833cc9f37 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/kr.py b/src/b4/kr.py
index f89f3024ec27..a2a9e280267e 100644
--- a/src/b4/kr.py
+++ b/src/b4/kr.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020-2021 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index e3c1df2f29e0..280bd15812cd 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/pr.py b/src/b4/pr.py
index 7cf736d026c1..2496a13b74f1 100644
--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index f2ba5635f7d8..642f4300db2a 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review/checks.py b/src/b4/review/checks.py
index 5239fcfb7ef6..684045c626df 100644
--- a/src/b4/review/checks.py
+++ b/src/b4/review/checks.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review/messages.py b/src/b4/review/messages.py
index b388d9356747..fe4171cf3fcd 100644
--- a/src/b4/review/messages.py
+++ b/src/b4/review/messages.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index c913a8c2eed9..ea3822a2372d 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review_tui/_common.py b/src/b4/review_tui/_common.py
index 4579d42f4b3e..fbdb67d019af 100644
--- a/src/b4/review_tui/_common.py
+++ b/src/b4/review_tui/_common.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review_tui/_entry.py b/src/b4/review_tui/_entry.py
index 700c5eae0e6a..105fea4721c4 100644
--- a/src/b4/review_tui/_entry.py
+++ b/src/b4/review_tui/_entry.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review_tui/_lite_app.py b/src/b4/review_tui/_lite_app.py
index 51e143786bd3..96873f1968bd 100644
--- a/src/b4/review_tui/_lite_app.py
+++ b/src/b4/review_tui/_lite_app.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 82471edaa127..80175e7b11da 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review_tui/_pw_app.py b/src/b4/review_tui/_pw_app.py
index 4a8e5c4af4cd..603e9d285b41 100644
--- a/src/b4/review_tui/_pw_app.py
+++ b/src/b4/review_tui/_pw_app.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 866948c5d45c..a28d1bd2a00e 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 4c25f8cf1054..e1c1595e8345 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
diff --git a/src/b4/tui/_common.py b/src/b4/tui/_common.py
index 844d9809d026..a37b4a636606 100644
--- a/src/b4/tui/_common.py
+++ b/src/b4/tui/_common.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 """Shared TUI utilities for b4 Textual apps."""
diff --git a/src/b4/tui/_modals.py b/src/b4/tui/_modals.py
index da3ca1390c4b..6fdc986faaf3 100644
--- a/src/b4/tui/_modals.py
+++ b/src/b4/tui/_modals.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 #
 """Shared modal screens for b4 Textual apps."""
diff --git a/src/b4/ty.py b/src/b4/ty.py
index bbce1499a8d0..2c934f1e6e1b 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2020 by the Linux Foundation
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
-- 
2.55.0


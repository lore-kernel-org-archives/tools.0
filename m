Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA5D352034
	for <tools@linux.kernel.org>; Fri, 14 Aug 2026 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710669; cv=none; b=QfUqLv2BB/VHlBPFaJFDDleNfkOwmZ8tozFFD32vgZAUQYi0Ncr1LcD7oxEKR2t+rv1Ie/TSkekFM/a+tk+eBzVnyzVCcIisin4KSJJFi4Swx6BVlaW8SgdCJKxI6o0vCj/CjQAFQaQ/JW2EHGSGjHCJC1wkTWYsXqTQOM+69Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710669; c=relaxed/simple;
	bh=oHMEdoZnrW57SPXiKshlCPR8WcXYvrY4mwElYe0o4f0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKQe2frhBdN3j+cldtRs9XO5pRRR6cN+snkxNmF3EBiXnLFc5fhxldB0IbXI7pYp88+pvJKoZu2F6FhgxTgrKLCfYWn/wLnxxz3iX2kTHV8X3JdyeV6PG82mD54FINYXlgl4M2VYBfW7ReyTe4vSAwUo1d7qnBJcMyO1shKh2I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lyxb1CE1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lyxb1CE1"
Received: by smtp.kernel.org (Postfix)
	id 5A01E1F00A3E; Fri, 14 Aug 2026 12:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA23B1F000E9;
	Fri, 14 Aug 2026 12:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786710668;
	bh=Gvi567RD25FkV7RuapiM5X6v0JqGWM0KzNyPjcFUwfQ=;
	h=From:To:Cc:Subject:Date;
	b=Lyxb1CE1Up0nT9JA7CRCbqRn4HsgXGz5Iv2wdHDu/VoJ7aPJz0B8oEypt1S79Z9/5
	 Z8FBXllcaNbUNDnvsx999jPVk07c42MuN9J/71XpgGVp75/D3OFUkGVy/Bw7T0NASq
	 E8dV+spDvYVAHfS//aXWTB9TKJgVfEbwsCDZzCKDdLNTtAh1ikjj/c0r7HIPDyUiYW
	 wIA3tVpFv+FmjOlgnUEd9ZcBWDpMuS4rvRxa0I3M/jk4xMsbxYmNCgJ/Gt4CAaEbFL
	 2DcN6zaIflgYdA4nWAkCUWgL7U6oEoVvY4gaQ2z+Wabg9dmzcnj3CzSqPZkVtFPmZG
	 lXAezWl9sddrw==
From: Maxime Ripard <mripard@kernel.org>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <mricon@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] ezgb: Drop shebang lines from library modules
Date: Fri, 14 Aug 2026 14:31:04 +0200
Message-ID: <20260814123104.1616487-1-mripard@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpmlint reports non-executable-script errors on all ezgb Python
modules. These files are installed as regular library modules with
0644 permissions, so the shebang line is unnecessary and triggers the
diagnostic.

Remove the shebang from all five modules.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 src/ezgb/__init__.py | 1 -
 src/ezgb/_git.py     | 1 -
 src/ezgb/_models.py  | 1 -
 src/ezgb/_reader.py  | 1 -
 src/ezgb/_writer.py  | 1 -
 5 files changed, 5 deletions(-)

diff --git a/src/ezgb/__init__.py b/src/ezgb/__init__.py
index 31867fdbe39e..d78d18fb47b8 100644
--- a/src/ezgb/__init__.py
+++ b/src/ezgb/__init__.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 """ezgb: a standalone Python library for git-bug repositories."""
 
diff --git a/src/ezgb/_git.py b/src/ezgb/_git.py
index c1c326bd6020..f91e517aa00d 100644
--- a/src/ezgb/_git.py
+++ b/src/ezgb/_git.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 """Thin git subprocess helpers for ezgb."""
 
diff --git a/src/ezgb/_models.py b/src/ezgb/_models.py
index 72eb75959d77..d5d7976ac4d0 100644
--- a/src/ezgb/_models.py
+++ b/src/ezgb/_models.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 """Data models, enums, exceptions, and constants for ezgb."""
 
diff --git a/src/ezgb/_reader.py b/src/ezgb/_reader.py
index cfd752816ac7..aa2a744bc174 100644
--- a/src/ezgb/_reader.py
+++ b/src/ezgb/_reader.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 """Git object reading, operation pack replay, and caching for ezgb."""
 
diff --git a/src/ezgb/_writer.py b/src/ezgb/_writer.py
index adacfa153f32..7e75fe5e9a17 100644
--- a/src/ezgb/_writer.py
+++ b/src/ezgb/_writer.py
@@ -1,6 +1,5 @@
-#!/usr/bin/env python3
 # -*- coding: utf-8 -*-
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (C) 2024 by the Linux Foundation
 """CLI wrappers for git-bug write operations."""
 
-- 
2.55.0


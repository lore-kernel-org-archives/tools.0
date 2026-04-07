Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B9F2BE641
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580528; cv=none; b=L6GvMl/LBGkU8oLP6hNRNprmcHMnH3qdKu8bOvOAEBQ+nUubWhwkULJ/MPTUOGfzI8WTvs+12yLLikfhYB+ERbrwdPtJOUjTMMzW64eRGg88PJlAgJHRyMyU3fpBV+KFsSt+Tj1ColYSlMc6v5oEbUqCdpQYZcDKq77NwNeuD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580528; c=relaxed/simple;
	bh=m7NLE2agi1gsyWAUHaM72vM4TmOa2pXwksdJxmE1ODQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vjk3V5KZNIx6gbHskW+7jcanHI2YscMv9v7dZKNUzLncKKn7/mJzBvnpNpyeSuNg8lyNAwHhMRrPLiwvEstU09jWEbgThpkdI/dUogjGDX7WG1UGR87fFB7+mCY0w/FsrH8yXBFI7s5kJHptzq6OZXSoL7Yrurck3WXxFI+UWjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOAO9KQP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOAO9KQP"
Received: by smtp.kernel.org (Postfix)
	id 923E4C2BCB1; Tue,  7 Apr 2026 16:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A23C2BCB0;
	Tue,  7 Apr 2026 16:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580528;
	bh=m7NLE2agi1gsyWAUHaM72vM4TmOa2pXwksdJxmE1ODQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bOAO9KQPlTp7jCUJuGnvOd8NaSQlVg0JBRQYHdBj+hZCCq57yWxKfodny4giHV3Oo
	 S+61Az9vhbL9TTr5hgV1d7lSQCRewxiyosD1tDiz8YMtA/gXZtJLikmgQOQ0yBDi82
	 601EX84lHE7YrjqA9EUXV3t2DpuK7KIckkrZOMwB76RNQ1oC+Tj4K3b6fTy4/EIEzg
	 O/ZSG/yWk1Woi+0JUxXRm0RgoGxGUm/pBS1uPpLBJ02/sP9aX3NLW05zpEK+TBPBC5
	 vKrHys7p8iadOponDdoE7clqxk3FKsRrgjchl36uAH+lR2H8f+VDzG28v587rN13/s
	 xGv8YySFgJsGg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:41 -0400
Subject: [PATCH b4 12/12] Add local CI review check
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ruff-check-v1-12-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2780; i=tamird@kernel.org;
 h=from:subject:message-id; bh=m7NLE2agi1gsyWAUHaM72vM4TmOa2pXwksdJxmE1ODQ=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTTP1csrsPKNPrJFtODqdsbL5eNydCvcrfVH/BQ4zS
 +w9wWDaMZGFQYyLwVJMkSVR9NDe9NTbe2Qz3x2HmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXQMdIwZuDgFYKrTDBkZnj/S8uZ7+Xom46eL35e9nFl1Szf0UeyeGssp8ltVutIFVjH8dzyh1tS
 oYNgm7ZAlwvJA/sqi6ccd3r1dtnEDT9gV6d4aXgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Configure b4's review TUI to run the project's local checks as a
per-series check command. The helper emits the JSON shape expected by b4
and records the input message headers so results show which series was
checked.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 .b4-config    |  1 +
 misc/b4-ci.py | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/.b4-config b/.b4-config
index ea95e4a..9fcebab 100644
--- a/.b4-config
+++ b/.b4-config
@@ -5,3 +5,4 @@
   send-series-cc = Konstantin Ryabitsev <konstantin@linuxfoundation.org>
   send-endpoint-web = https://lkml.kernel.org/_b4_submit
   send-prefixes = b4
+  review-series-check-cmd = uv run --all-extras completion --all-groups python misc/b4-ci.py
diff --git a/misc/b4-ci.py b/misc/b4-ci.py
new file mode 100644
index 0000000..c65863c
--- /dev/null
+++ b/misc/b4-ci.py
@@ -0,0 +1,57 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+"""Run b4's local CI checks for the review TUI."""
+
+import json
+import subprocess
+import sys
+from email.parser import BytesParser
+from email.policy import default
+from typing import Dict, List
+
+CHECKS = [
+    ('ruff', ['ruff', 'check', '.']),
+    ('mypy', ['mypy', '.']),
+    ('pyright', ['pyright', '.']),
+    ('ty', ['ty', 'check', '.']),
+    ('pytest', ['pytest', '--durations=20']),
+]
+
+
+def read_input_details() -> List[str]:
+    msg = BytesParser(policy=default).parse(sys.stdin.buffer, headersonly=True)
+    details: List[str] = []
+    if subject := msg.get('Subject'):
+        details.append(f'Input-Subject: {subject}')
+    if msgid := msg.get('Message-ID'):
+        details.append(f'Input-Message-ID: {msgid}')
+    return details
+
+
+def run_check(tool: str, cmd: List[str], input_details: List[str]) -> Dict[str, str]:
+    proc = subprocess.run(cmd, capture_output=True, text=True, check=False)
+    details = [f'$ {" ".join(cmd)}']
+    if input_details:
+        details.extend(['', *input_details])
+    if proc.stdout:
+        details.extend(['', proc.stdout.rstrip()])
+    if proc.stderr:
+        details.extend(['', proc.stderr.rstrip()])
+
+    return {
+        'tool': tool,
+        'status': 'pass' if proc.returncode == 0 else 'fail',
+        'summary': 'passed' if proc.returncode == 0 else f'failed with exit code {proc.returncode}',
+        'details': '\n'.join(details),
+    }
+
+
+def main() -> None:
+    input_details = read_input_details()
+    results = [run_check(tool, cmd, input_details) for tool, cmd in CHECKS]
+    json.dump(results, sys.stdout, indent=2)
+    sys.stdout.write('\n')
+
+
+if __name__ == '__main__':
+    main()

-- 
2.53.0


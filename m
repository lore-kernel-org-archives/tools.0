Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABFA13D29F
	for <tools@linux.kernel.org>; Tue, 21 May 2024 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716302517; cv=none; b=Mz79TuaG73Qhg5ih/8i5FzwQ7jw7kkKcx+QmddU0d7J/jX+elWF1hm53M0a6jdQqZYuKo0i0I8OfStA/eSio/a+4v4KafR+VopqHQ7Sd5fNewYCtRYoLjfeKlu4EL94ymCGh/aVKviE2i5TZzxj64tKmI2WoXzcHjhS6e8BZk+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716302517; c=relaxed/simple;
	bh=C4xXUJWGjBRwNncPXB8R9t8RvaWMX4Ng+0mLjI0MQ5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WC6gGXEubTeCxRx9nv3rodvS+/N3RLdAbbGuDTVjS81yXkK9RXisWZbygeihiGa7KTiH1J5X0q5ZIZtXJKcdX4IWVu19CiLfSMYaX4EflbyX/lILEjKEoUaWizT0C4wOTMf5W3FTwFcN6BRsj6nn1O4jxmaZE7xiN7oRBkEKuVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BlJ0+7pW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BlJ0+7pW"
Received: by smtp.kernel.org (Postfix)
	id E3103C4AF09; Tue, 21 May 2024 14:41:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A48EC32789
	for <tools@kernel.org>; Tue, 21 May 2024 14:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A48EC32789
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 655931C0006;
	Tue, 21 May 2024 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716302513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8MbadUMiVpDrqt/BO2VZj3ZhgedcAx92CPjfz5nr0c=;
	b=BlJ0+7pW7uJKSOWgpazO7un+f/wqHkxr6itnsPxXi1/q+IZhzEwzNZQo26gvQah3NPdYvP
	4xSf9NAfnt1piN+penOR1ddOsICivO83+9HAwbozqOe5EW2s0j1kjQcbgtsQKx8aoOyZZC
	2u0q87Q2NvIgC2mh23RolX1S6ZJjvzoq2ueBJSgICT7dQEeOV8cxhNzPav4wDnQ5AmksWk
	Ga7nOyoi/iCefW7fS9rkoHxFvwRwnaRwYC+68sNwIjb0ST7X1RfemT3z44bzC5rvMAbaCD
	AysEQQ02P/0JR+NcS/5xLxcdtnNRuFsCi6K8Dk/SzKWfN2u/R5naJiAa2fKHTw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 May 2024 16:41:37 +0200
Subject: [PATCH b4 1/2] ez: Ensure that all the info dict keys are defined
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-fix-check-deps-v1-1-d149bf40e7ee@bootlin.com>
References: <20240521-fix-check-deps-v1-0-d149bf40e7ee@bootlin.com>
In-Reply-To: <20240521-fix-check-deps-v1-0-d149bf40e7ee@bootlin.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5170;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=C4xXUJWGjBRwNncPXB8R9t8RvaWMX4Ng+0mLjI0MQ5E=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmTLKw4yhdyJ/BTla7LO2xQ2+T4eUNquOYDrRDR
 7DcFmwcgqyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkyysAAKCRAgrS7GWxAs
 4oIvEACyyMCp5BUFe7D93OQ4sZu2OccsKC/MQK7rR3v1E222F84q24upg9jKPNM3z6L2mDCKPys
 skTmo9ZAs8vQrgCcBk2KaaP5V4kbNL4lqpSxWegeEjF66m7K/umHewuprzcQVzZ9nrN9IGJM21n
 XZs9wfzSlRep1d3SBWO9SHqQGGcQmyTsPwgOoC+wLUBhXj3s4hPlVzEjpA2Ct/S2Yh8ByTRN+wX
 PxSlm3NHYu0TkVKXqoLtOQ0GWuCf6lbGhNUa8TQ1T89SzjsQHR98d6RxxYE5k2pCBzzGnHp97Np
 iVl0Xbrjdvx2v0yh349F9hhhsCxx+tZyUAhfqgBxlzZktZIybEb9s5IjN4AgzZfPqFPHojiAPxo
 ZiPbsu1jRFcI0QHtRKnA8W2y7mdO+VO3k8q+44goPTD9w0CRrhYegGNuNit27jH9FwSQsXCcCYQ
 aSezDX5Ydmm61Mrigpq4uTivBPSifmFn8zTruc4GWA3sKZRw6YADq89tkjP5nf9tIAaalCsJD/1
 GHbhBwJAU+GabwLGQaxqqE+6HNpQ9YH7auoDB+N+5jJS7ZfBYJdlon/83/WayfcrH58kUdnRvrA
 adOYs4YdAFyEFP/15XVqK/eNWCbItABuDR9M7FJjY/jNjyq5n8M8fNQv9ZCaZ+JykACBX1ZdBnP
 22FR2meK8hG0fow==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

In some situations, a few keys in the info dictionary were not defined,
which could lead to "KeyError" errors (for example, 'needs-auto-to-cc' and
'needs-checking' were not always defined). To prevent these errors and
simplify the code logic, I used a literal dictionary initialization for
the info dictionary.
---
 src/b4/ez.py | 74 ++++++++++++++++++++++++++----------------------------------
 1 file changed, 32 insertions(+), 42 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index e1a4d67696ad..76121ab02d03 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2401,7 +2401,8 @@ def show_info(param: str) -> None:
     prep_info = get_info(usebranch=mybranch)
     if getval == '_all':
         for key, val in prep_info.items():
-            print('%s: %s' % (key, val))
+            if val is not None:
+                print('%s: %s' % (key, val))
     elif getval in prep_info:
         print(prep_info[getval])
     else:
@@ -2411,57 +2412,46 @@ def show_info(param: str) -> None:
 
 def get_info(usebranch: str) -> Dict[str, str]:
     is_prep_branch(mustbe=True, usebranch=usebranch)
-    info = dict()
-    info['branch'] = usebranch
     cover, tracking = load_cover(usebranch=usebranch)
     csubject, cbody = get_cover_subject_body(cover)
-    info['cover-subject'] = csubject.full_subject
     ts = tracking['series']
-    if ts.get('prefixes'):
-        info['prefixes'] = ' '.join(ts.get('prefixes'))
-    info['change-id'] = ts.get('change-id')
-    revision = ts.get('revision')
-    info['revision'] = revision
-    strategy = get_cover_strategy(usebranch=usebranch)
-    info['cover-strategy'] = strategy
-    if ts.get('base-branch'):
-        info['base-branch'] = ts['base-branch']
     base_commit, start_commit, end_commit, oneline, shortlog, diffstat = get_series_details(usebranch=usebranch)
-    info['needs-editing'] = False
     todests, ccdests, tag_msg, patches = get_prep_branch_as_patches(usebranch=usebranch, expandprereqs=False)
-    if not todests and not ccdests:
-        info['needs-recipients'] = True
-    else:
-        info['needs-recipients'] = False
-    if b'EDITME' in b4.LoreMessage.get_msg_as_bytes(patches[0][1]):
-        info['needs-editing'] = True
     prereqs = tracking['series'].get('prerequisites', list())
-    info['has-prerequisites'] = len(prereqs) > 0
     tocmd, cccmd = get_auto_to_cc_cmds()
-    if tocmd or cccmd:
-        info['needs-auto-to-cc'] = True
     ppcmds, scmds = get_check_cmds()
-    if ppcmds or scmds:
-        info['needs-checking'] = True
     pf_checks = get_preflight_checks(usebranch=usebranch)
-    if pf_checks is not None:
-        if (tocmd or cccmd) and 'auto-to-cc' in pf_checks and not info['needs-recipients']:
-            info['needs-auto-to-cc'] = False
-        if (ppcmds or scmds) and 'check' in pf_checks:
-            info['needs-checking'] = False
-        if info['has-prerequisites']:
-            info['needs-checking-deps'] = 'check-deps' not in pf_checks
-        else:
-            info['needs-checking-deps'] = False
-    if info['needs-editing'] or info['needs-auto-to-cc'] or info['needs-checking'] or info['needs-checking-deps']:
-        info['preflight-checks-failing'] = True
-    else:
-        info['preflight-checks-failing'] = False
 
-    info['base-commit'] = base_commit
-    info['start-commit'] = start_commit
-    info['end-commit'] = end_commit
-    info['series-range'] = f'{start_commit}..{end_commit}'
+    info = {
+        # General information about this branch
+        'branch': usebranch,
+        'cover-subject': csubject.full_subject,
+        'base-branch': ts.get('base-branch'),
+        'base-commit': base_commit,
+        'start-commit': start_commit,
+        'end-commit': end_commit,
+        'series-range': f'{start_commit}..{end_commit}',
+
+        # General information about this branch status
+        'prefixes': ' '.join(ts.get('prefixes', [])) or None,
+        'change-id': ts.get('change-id'),
+        'revision': ts.get('revision'),
+        'cover-strategy': get_cover_strategy(usebranch=usebranch),
+
+        # General information about this branch checks
+        'needs-editing': b'EDITME' in b4.LoreMessage.get_msg_as_bytes(patches[0][1]),
+        'needs-recipients': bool(not todests and not ccdests),
+        'has-prerequisites': len(prereqs) > 0,
+        'needs-auto-to-cc': None,
+        'needs-checking': bool(ppcmds or scmds) and 'check' not in pf_checks,
+        'needs-checking-deps': len(prereqs) > 0 and 'check-deps' not in pf_checks,
+        'preflight-checks-failing': None,
+    }
+    info['needs-auto-to-cc'] = info["needs-recipients"] or (bool(tocmd or cccmd) and 'auto-to-cc' not in pf_checks)
+    info['preflight-checks-failing'] = bool(info['needs-editing'] or info['needs-auto-to-cc'] or
+                                            info['needs-checking'] or info['needs-checking-deps'])
+
+    # Add commits information
     for line in oneline:
         short, subject = line.split(maxsplit=1)
         info[f'commit-{short}'] = subject

-- 
2.43.2


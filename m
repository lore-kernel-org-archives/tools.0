Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EC924F29
	for <tools@linux.kernel.org>; Tue, 15 Nov 2022 18:01:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 97507CBA46
	for <tools@linux.kernel.org>; Tue, 15 Nov 2022 17:23:52 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id B33E62000A;
	Tue, 15 Nov 2022 17:23:43 +0000 (UTC)
From: Quentin Schulz <foss+kernel@0leil.net>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH v2] git_range_to_patches: actually add to/cc headers from cover letter to single-commit series
Date: Tue, 15 Nov 2022 18:23:24 +0100
Message-Id: <20221114-prep-format-patch-single-patch-to-cc-v2-0-70a9019eb90c@theobroma-systems.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The intent of the original code was to copy the Cc and To headers from
the cover letter, previously added with b4 prep --auto-to-cc. However,
those are added in the commit log which means a newline is inserted
between the subject header and the start of the commit log, "breaking"
the mail parsing because the rest is assumed to be the body of the mail.

Since the To: and Cc: lines are assumed to be in-body, and therefore not
parsed by the mail backend, they cannot be fetched with mail.get('To')
since the header isn't actually set.

Instead, let's use the Cc and To fields returned by get_body_parts of
the covermsg into ctrailers list of LoreTrailer and then add the ones
that are supposed to be To or Cc headers to the single-commit patch
headers.

Fixes: 6c215d83473d ("ez: don't send a cover letter for a 1-patch series")
Fixes: c748abf6ad2a ("ez: don't send a cover letter for a 1-patch series") #v0.10.1
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
git_range_to_patches: actually add to/cc headers from cover letter to single-commit series

This probably wasn't detected because git-send-email is capable of
adding the Cc: fields in the "snipped" section of a patch (---) even if not in
the headers but not the To: fields.

To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
Changes in v2:
- fix From: field,
- remove list cast for ctrailers as unnecessary,
- Link to v1: https://msgid.link/20221114-prep-format-patch-single-patch-to-cc-v1-0-e8dddbd07096@theobroma-systems.com
---
 b4/__init__.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index f5bbc53..590c756 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2779,13 +2779,11 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
 
             pbody = LoreMessage.rebuild_message(pheaders, pmessage, ptrailers, newbasement, csignature)
             pmsg.set_payload(pbody, charset='utf-8')
+
             # Add any To: and Cc: headers from the cover_message
-            toh = covermsg.get('To')
-            if toh:
-                pmsg.add_header('To', toh)
-            cch = covermsg.get('Cc')
-            if cch:
-                pmsg.add_header('Cc', cch)
+            for ctrailer in ctrailers:
+                if ctrailer.name in ('To', 'Cc'):
+                    pmsg.add_header(ctrailer.name, ctrailer.value)
             startfrom = 0
         else:
             patches.insert(0, (None, covermsg))

---
base-commit: 287477e9e0149b42e444471da9dca629ebacf2e1
change-id: 20221114-prep-format-patch-single-patch-to-cc-2a878158d50b

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

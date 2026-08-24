Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E6030D3FE
	for <tools@linux.kernel.org>; Mon, 24 Aug 2026 13:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787578508; cv=none; b=kAYDLgFuR7c4AmQVdgdGX4xcAoVN2z3DUfnYCUU3YUprG5nfJGntpdqmejvIM2erU1iV6YQEqLzHHcC6Bz/bGkZBIVHbkiPK1xbDxgDFIoFA25TkuUf2sWYvtUXFkY6u+qDLeK+yIzDRWN6c+blcrfpQbWjUhJGXTeMX77XL7b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787578508; c=relaxed/simple;
	bh=pCLuKY/FktXOSieleZxmWNIgHi2c+OnjyeHku4yKWZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aw/qJemt5t6NO1DWiu+2BzMzKzK0Zxz6RE9bGbZj1O8rjw3qORS9Ud0pFUXE0ZQaeiwI2TsPgL8SeFYMCSDxkDRbWgOSxY54MfYupp3f9kLagcEvUEWke84pOBdKRlN3pQ2N/VbfHP0TJ5JDdGTdMApULJnPy4qJiHHyim3fNtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CvPgrxLt; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CvPgrxLt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 23B321A17E7
	for <tools@linux.kernel.org>; Mon, 24 Aug 2026 13:35:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E51705FFC1
	for <tools@linux.kernel.org>; Mon, 24 Aug 2026 13:35:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 030AE11C7954C;
	Mon, 24 Aug 2026 15:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787578498; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yCdf1WSAgBTyvgsJoVtQT4kW5hX51cZ1XTumz5jeOzg=;
	b=CvPgrxLtbOaVbTiaJ309fb1Y3r48tnyHQ0XYuTVj+1WR4ii9NiMzAJmxFVYyuDNDBsFP46
	QcNBEF9nEl04Ab7pvseR58TcIyq4NWrGPdXvAPRE4V7VjJyu5X9JkB7tdErH/p53JhfZaL
	8Csy2IrPTioEJlAj06bku9iR9MX2PIiDc+yGXD8kObv53hqDZh+IR9bPpWQjyzdXzf5/j0
	6uiyKLK5pMO/+eXlXBsl20mb8YN/iAz8aZZcEzkI2OX0UHBv5bleR1kIEWxRjQQpIo7l/w
	ORo6BkpNNmK2sB9JCUcgg0fcYHYFSwKkfsNQqmK7bJUYp0/H5yequbEhw0hlRA==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: tools@linux.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [PATCH] git-patchwork-bot: prevent wrong encoded split in To: field
Date: Mon, 24 Aug 2026 15:34:56 +0200
Message-ID: <20260824133456.23805-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

notify_submitters() build the submitter To: header by RFC 2047-encoding
the entire 'Name <addr>' string through email.header.Header(). For long
non-ASCII display names the encoded-word exceeds the 75-character
folding limit and is split mid-token, shredding the adjacent address;
MTAs may then interpret the leftover fragments as bare local-parts and
append a hostname, producing a mangled and undeliverable To: header
(e.g.  '...@aws-us-west-2-korg-oddjob- rhel9-1.codeaurora.org').

Add the _format_recipient() helper which uses email.utils.formataddr()
to encode only the display name while keeping the bare <addr> literal
and intact.  While at it, make sure to use the same logic for both
branches generating the 'To' field. Add a small test validating that the
address part remains untouched.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
An example of the issue in the wild can be found in [1], resulting in
the submitter never receiving the merge confirmation mail.

[1] https://lore.kernel.org/bpf/178734001048.1447337.676425481174448454.git-patchwork-notify@kernel.org/
---
 git-patchwork-bot.py        | 12 +++++++++---
 tests/test_patchwork_bot.py | 25 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/git-patchwork-bot.py b/git-patchwork-bot.py
index 0fa112e85262..2aa5b2db6037 100755
--- a/git-patchwork-bot.py
+++ b/git-patchwork-bot.py
@@ -32,7 +32,7 @@ import time
 from email import charset
 from email.header import Header
 from email.mime.text import MIMEText
-from email.utils import formatdate, getaddresses, make_msgid
+from email.utils import formataddr, formatdate, getaddresses, make_msgid
 from fcntl import LOCK_EX, LOCK_NB, lockf
 from string import Template
 from typing import Any, Dict, List, Optional, Set, Tuple, Union
@@ -998,6 +998,12 @@ def send_summary(serieslist: List[Dict[str, Any]],
     return str(msg['Message-Id'])
 
 
+def _format_recipient(name: Optional[str], addr: str) -> str:
+    """Build a 'Name <addr>' header value, encoding only the display name."""
+
+    return formataddr((name or '', addr))
+
+
 def get_tweaks(pconfig: Dict[str, str], hconfig: Dict[str, Any]) -> Dict[str, str]:
     fields = ['from', 'summaryto', 'onlyto', 'neverto', 'onlyifcc', 'neverifcc',
               'alwayscc', 'alwaysbcc', 'cclist', 'ccall']
@@ -1155,10 +1161,10 @@ def notify_submitters(serieslist: List[Dict[str, Any]],
 
         if 'onlyto' in tweaks:
             targets = listify(tweaks['onlyto'])
-            msg['To'] = '%s <%s>' % (submitter.get('name'), targets[0])
+            msg['To'] = _format_recipient(submitter.get('name'), targets[0])
         else:
             targets = [submitter.get('email')]
-            msg['To'] = Header('%s <%s>' % (submitter.get('name'), submitter.get('email'))).encode()
+            msg['To'] = _format_recipient(submitter.get('name'), submitter.get('email'))
 
             ccaddrs: List[str] = list()
             if tweaks.get('alwayscc'):
diff --git a/tests/test_patchwork_bot.py b/tests/test_patchwork_bot.py
index 2a6a6c53a887..658dbe523d8d 100644
--- a/tests/test_patchwork_bot.py
+++ b/tests/test_patchwork_bot.py
@@ -488,6 +488,31 @@ class TestGetTweaks:
             assert result[f] == f'p-{f}'
 
 
+class TestFormatRecipient:
+    """Tests for _format_recipient() header construction."""
+
+    def test_ascii_name_and_addr(self):
+        value = pwbot._format_recipient('Alexis Lothe', 'alexis.lothore@bootlin.com')
+        assert value == 'Alexis Lothe <alexis.lothore@bootlin.com>'
+
+    def test_name_without_addr_falls_back(self):
+        value = pwbot._format_recipient(None, 'alexis.lothore@bootlin.com')
+        assert value == 'alexis.lothore@bootlin.com'
+
+        value = pwbot._format_recipient('', 'alexis.lothore@bootlin.com')
+        assert value == 'alexis.lothore@bootlin.com'
+
+    def test_nonascii_name_keeps_addr_intact(self):
+        name = 'Alexis Lothoré (eBPF Foundation)'
+        addr = 'alexis.lothore@bootlin.com'
+        value = pwbot._format_recipient(name, addr)
+        from email.utils import getaddresses
+        (parsed_name, parsed_addr), = getaddresses([value])
+        assert parsed_addr == addr
+        assert addr in value
+        assert '<%s>' % addr in value
+
+
 class TestGitGetNewRevs:
     """Tests for git_get_new_revs() with mocked git output."""
 
-- 
2.55.0


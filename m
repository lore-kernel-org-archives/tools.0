Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DAE70
	for <tools@linux.kernel.org>; Fri, 28 May 2021 04:26:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyleam.com; s=key1;
	t=1622176000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D2qsYAodEbE/yNJ9Zf8uflC4JD90EV2xS4rnDxmfGiA=;
	b=T5G2BX799wDV/sJDwbCNx2AEUiyfzBqi9/SMLK2ooSfyPx7vyxnonZLpft90F8y+gFReNX
	iIXOev8SD2W+seBptcjJL9sNqnWC49jKEkjyfpCZBw2JIwtRowd8ddfx8S4GZKCQXRvLWk
	JKbMZDW/N8cDrrxOPbBEYH72ogQVJx5E+PcZdEb1luKWQdWSL677+eCDpgPiyuwsOaljSG
	u88pnRvoXhVMjxRhsB7Y4lmHPdFRbgFg+RHf8K3H6PIkMwSCBEYI2xNlo0AR7WOsVzV4g/
	EvBwVZ+nZ7joqJXsRoBPbgugn3zpORaWKtRYvd6Y/kXWAGynT6GyAhEls0kujw==
From: Kyle Meyer <kyle@kyleam.com>
To: tools@linux.kernel.org
Subject: [PATCH b4] Limit 'From mboxrd@z' replacement to start of message
Date: Fri, 28 May 2021 00:26:35 -0400
Message-Id: <20210528042635.24959-1-kyle@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: kyle@kyleam.com

save_git_am_mbox() replaces 'From mboxrd@z ' with 'From git@z ' to
make it clear that the output format is not mboxrd.  However, all
occurrences in the message are replaced, corrupting patches that
contain 'From mboxrd@z '.  Restrict the replacement to the first line
of the message.

Signed-off-by: Kyle Meyer <kyle@kyleam.com>
---
 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 2b35a42..17c569d 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2275,7 +2275,7 @@ def save_git_am_mbox(msgs: list, dest):
         bmsg = msg.as_bytes(unixfrom=True, policy=emlpolicy)
         # public-inbox unixfrom says "mboxrd", so replace it with something else
         # so there is no confusion as it's NOT mboxrd
-        bmsg = bmsg.replace(b'From mboxrd@z ', b'From git@z ')
+        bmsg = re.sub(b'^From mboxrd@z ', b'From git@z ', bmsg)
         bmsg = bmsg.rstrip(b'\r\n') + b'\n\n'
         dest.write(bmsg)
 

base-commit: ee5e56d06c786d7906c214fc1f8cbbeeb3e658a6
-- 
2.31.1


Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959691FA7
	for <tools@linux.kernel.org>; Thu, 25 Aug 2022 06:50:20 +0000 (UTC)
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 25 Aug 2022 08:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1661409669; bh=wemmaXqqHPV4CsObvmzaX7urd009VThOsbH77cYoEqE=;
	h=From:To:Cc:Subject:Date:From;
	b=DKjVTeI8vV10yiuEMlyBkrUZKvmnjR5oeTmscJCsPklcaiBub1pp6T1WCKB/CiLCB
	 Ue3LPoCQO2dlfBqD7gsulO2zgKmkF4tncyRJgd4Cf6cFdnbmy4GCLdGwir8Yr/cMcp
	 c/5W86O7dvjhw1OoBw/QxpfwIywmxbtEAurLj6Pw=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 33BDF8024B;
	Thu, 25 Aug 2022 08:41:09 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 26AB7181C18; Thu, 25 Aug 2022 08:41:09 +0200 (CEST)
From: Nicolas Schier <n.schier@avm.de>
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH b4] mbox: Exit with error code if no messages were found
Date: Thu, 25 Aug 2022 08:41:09 +0200
Message-Id: <20220825064109.550092-1-n.schier@avm.de>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1661409669-D1BAA7E9-795DA8B2/0/0
X-purgate-type: clean
X-purgate-size: 730
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

When mbox.main() is unable to retrieve any messages, some kind of error
happend (e.g. msgid has not been found).  Forward error state to the
parent process by exiting with exit code 1, to allow proper
handling.

Signed-off-by: Nicolas Schier <n.schier@avm.de>
---
 b4/mbox.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/mbox.py b/b4/mbox.py
index 9a6ea9c..0d258da 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -755,7 +755,7 @@ def main(cmdargs):
 
     msgid, msgs = get_msgs(cmdargs)
     if not msgs:
-        return
+        sys.exit(1)
 
     if len(msgs) and cmdargs.checknewer:
         msgs = get_extra_series(msgs, direction=1, useproject=cmdargs.useproject)
-- 
2.37.2


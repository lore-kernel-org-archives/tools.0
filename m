Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2CA29CA
	for <tools@linux.kernel.org>; Thu, 18 Nov 2021 12:15:20 +0000 (UTC)
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 18 Nov 2021 13:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1637237119; bh=x/zUMv4S903Os4ry4thkOwxskS7AvXzjhUiAjce8Nxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOB0Rt9jRBfWzy1EgazDG6apy7p8WeH+Qthpix5OBIyeQONO8xrcUWVwSveQ0FV7A
	 qroJSRBNQ3+NP9rvwDodSXW6p8B316KLgSpfixFF0zisBf2gVk/ObGZQM2uDGj8x7U
	 Ct34kWtnTf/gqq6UloTOkZu13QyOUkOXA2j1TAw0=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 624028054F;
	Thu, 18 Nov 2021 13:05:19 +0100 (CET)
Received: from nsc-arm64.ads.avm.de (unknown [172.27.14.4])
	by buildd.core.avm.de (Postfix) with ESMTP id 57F6318171F;
	Thu, 18 Nov 2021 13:05:19 +0100 (CET)
Received: by nsc-arm64.ads.avm.de (Postfix, from userid 1000)
	id 4723974016A; Thu, 18 Nov 2021 13:05:19 +0100 (CET)
From: Nicolas Schier <n.schier@avm.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org,
	Nicolas Schier <n.schier@avm.de>
Subject: [PATCH 1/1] mbox: Exit with error code if no messages were found
Date: Thu, 18 Nov 2021 13:05:14 +0100
Message-Id: <20211118120514.277328-2-n.schier@avm.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211118120514.277328-1-n.schier@avm.de>
References: <20211118120514.277328-1-n.schier@avm.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1637237119-0000056E-16D55A87/0/0
X-purgate-type: clean
X-purgate-size: 778
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

When mbox.main() is unable to retrieve any messages, there happened some
kind of error (e.g. msgid has not been found).  Forward error state to
the parent process by exiting with an error code, to allows proper
handling, e.g. in shell command concatenations.

Signed-off-by: Nicolas Schier <n.schier@avm.de>
---
 b4/mbox.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/mbox.py b/b4/mbox.py
index 05d46b5..d67e456 100644
--- a/b4/mbox.py
+++ b/b4/mbox.py
@@ -722,7 +722,7 @@ def main(cmdargs):
 
     msgid, msgs = get_msgs(cmdargs)
     if not msgs:
-        return
+        sys.exit(1)
 
     if len(msgs) and cmdargs.checknewer:
         msgs = get_extra_series(msgs, direction=1, useproject=cmdargs.useproject)
-- 
2.30.2


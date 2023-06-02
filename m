Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89BE19E63
	for <tools@linux.kernel.org>; Fri,  2 Jun 2023 15:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE06C4339B;
	Fri,  2 Jun 2023 15:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685719563;
	bh=AtuV8AH3cf9vkUdgngCaQM/VNU+fDnPU8z6NYS6SXLU=;
	h=From:To:Cc:Subject:Date:From;
	b=XRbQm2s/dOC8nu47QnLs2l3adR9MiqUxLyumjif76TH95t+Si1slsACtT+iU6agQw
	 Pr54l+KW7OAfDdFssY9h003l517u5PUwfvAMSjMS/xzA4+tZIPv/wKveJYHBa0188X
	 RGttD+sm5LR95nN5wcVoohw1NaxXLW1ocsgdvGFXC/IcrMl3n9Wm2STr/6t+TTTr/+
	 kHRUTHzxhDsvHqnL0QNBzpBupAi8MPhOLVfZeBZUEYd8OyciBg1VsUdHeCGDurhYmu
	 D/1j92tr/EwlOLg+RHYbcDQtKN6I4Q/9hI9VBtVF+QteNuL6qt/2gIlrCJXRHdllAO
	 23c3PTqsys33Q==
From: Maxime Ripard <mripard@kernel.org>
To: tools@linux.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] b4: Fix envelopeSender handling
Date: Fri,  2 Jun 2023 17:25:54 +0200
Message-Id: <20230602152554.2046764-1-mripard@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The manpage for git-send-email states that:

  Specify the envelope sender used to send the emails. This is useful if
  your default address is not the address that is subscribed to a list. In
  order to use the From address, set the value to "auto". If you use the
  sendmail binary, you must have suitable privileges for the -f parameter.
  Default is the value of the sendemail.envelopeSender configuration
  variable; if that is unspecified, choosing the envelope sender is left to
  your MTA.

However, b4 just reuses the value of sendemail.envelopeSender and passes it
down directly to the sendmail binary if relevant, which means that if we
were using the value "auto", we now have sendemail called with -f auto
instead of the proper mail address, confusing sendmail.

We can fix this by interpreting the auto value as suggested in the manpage.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 b4/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 0197cf17ed33..9b1f69c9ff7b 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -3247,7 +3247,10 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
         # Do we have the envelopesender defined?
         env_sender = sconfig.get('envelopesender', '')
         if env_sender:
-            envpair = email.utils.parseaddr(env_sender)
+            if env_sender == "auto":
+                envpair = email.utils.parseaddr(fromaddr)
+            else:
+                envpair = email.utils.parseaddr(env_sender)
         else:
             envpair = email.utils.parseaddr(fromaddr)
         if envpair[1]:
-- 
2.40.1


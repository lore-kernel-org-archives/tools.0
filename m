Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B93672
	for <tools@linux.kernel.org>; Wed, 11 Aug 2021 02:41:36 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id t66so867326qkb.0
        for <tools@linux.kernel.org>; Tue, 10 Aug 2021 19:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9FQiX/Q9yVOnpjSXoaIjjCCe0usVqbNzLMQb1QiyGUU=;
        b=IGe58bUtKm14FP4uzLocUy213t+L34MR3UlNxw/LB+YARbw/v4X+Nn4G6nOQdF6U3A
         UeHKmSKai6CfJXZk0Qy2a5V5KfVgxqljd2WpCAOjSlV2FZAHo7g3EKQ/1KyY7WPfz10+
         kq6Vk0teVm5H1PFiHsQ5yDGov5lpZxPy20k9qoV9Z08Ovi3BwNIrsDyNbJBtHt8v02ZU
         oplAN9SHPORRfbuoyo397e+Wsw8XCDM4kTn80Qx30YrPQRX4wiA8BktOO5MRbzzWRNyL
         Z1DHHjHd/HNMVqeWVkGK8EsDznzTPoBCT+bQnYBLZWRRWHDJebDAPGn6IE/h3h3qQcO8
         t69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9FQiX/Q9yVOnpjSXoaIjjCCe0usVqbNzLMQb1QiyGUU=;
        b=mK0oEJPZUh/DzPolWegG9aSB6My7Fzer2wCmv0SPnRZVvyNTCR7IEfrEaWJ4tVgC90
         QSr+8xBBLS/3ILlQVwhsH5eqU3B1aSFB3AZ30zlFquTUgf/l5V8ejpc/vn/6IwFGi6jy
         hLvHyiG+pduqL9/n7f4Y+OuRqXAb4PkIAJ4KSLpkNNdIRv2dk6ZPyaeWLE9DZt9THecH
         OHstiyk7Ed/KG4sqyJMS0eR6uq+1G3YZdi+mjsvkAJNCrcG8l8xxFl7zVA2OosAvSHiu
         Nkfv3e+8Cl9auQRtewlHK6l8ePLK3+6bZRYAtYxiDCjXt5dHRU+w94Fz1s6D8qrmnJW4
         NcNg==
X-Gm-Message-State: AOAM533Ni5QCuVl/7aGRAZdovLO8rvDq4I1ryr6s6gmUsCBLepqaZg8y
	oQEfDclNQgk2E6zcEtsUoTKYEmUplhE=
X-Google-Smtp-Source: ABdhPJzSOEZOj46FcI4qDUoXPDawwKLSeXt5R3LLtBiLVUnIhOSLc1Qswnl12uSjMGlDDejD42/ZZQ==
X-Received: by 2002:a05:620a:1187:: with SMTP id b7mr19445201qkk.174.1628649694974;
        Tue, 10 Aug 2021 19:41:34 -0700 (PDT)
Received: from localhost.localdomain (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id b22sm3694818qtr.2.2021.08.10.19.41.33
        for <tools@linux.kernel.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Aug 2021 19:41:34 -0700 (PDT)
From: Philippe Blain <levraiphilippeblain@gmail.com>
To: tools@linux.kernel.org
Subject: [PATCH b4] Reorder headers for `git imap-send` compatibility
Date: Tue, 10 Aug 2021 22:41:32 -0400
Message-Id: <20210811024132.8496-1-levraiphilippeblain@gmail.com>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When downloading messages from a public-inbox instance, reorder the
"From", "Date" and "Subject" headers in that specific order. This allows
the output from 'b4 mbox -o- $url' to be piped to 'git imap-send', which
expects these headers in that specific order.

An easy place to implement that is in 'mailsplit_bytes', which is called
by 'get_pi_thread_by_url' and already loops over the messages in the 'git
mailsplit'-ed mbox file to populate the message list.

Note that 'mailsplit_bytes' is also called by 'get_msgs' directly when
piping in a local mailbox, i.e. when '-' is used as the value of
'--use-local-mbox', but it does no harm to also reorder the headers in
that case.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---

Notes:
    Hi, I suggested that feature in [1] last December and just recently took the
    time to implement it.
    
    Konstantin suggested in his response to [1] to try using isync/mbsync instead,
    but I would prefer not having to change my workflow.  I've been using 'git
    imap-send' for a while with my custom script [2] when hitting emails that were
    not created with 'git send-email'/'git format-patch' and I did not hit any
    corner case where 'git imap-send' was not able to send the email.
    
    [1] https://lore.kernel.org/tools/7e6329fa-e5fa-c5af-002d-a8fbb60e0724@gmail.com/
    [2] https://gist.github.com/phil-blain/d350e91959efa6e7afce60e74bf7e4a8

 b4/__init__.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index b45e26f..baea003 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2162,6 +2162,13 @@ def get_strict_thread(msgs, msgid):
 
     return strict
 
+def reorder_headers(msg):
+    """ Reorder "From", "Date" and "Subject" headers in the order `git imap-send` expects"""
+    for header in ['From', 'Date', 'Subject']:
+        header_content = msg[header]
+        del msg[header]
+        msg[header] = header_content
+    return msg
 
 def mailsplit_bytes(bmbox: bytes, outdir: str) -> list:
     logger.debug('Mailsplitting the mbox into %s', outdir)
@@ -2174,7 +2181,7 @@ def mailsplit_bytes(bmbox: bytes, outdir: str) -> list:
     # Read in the files
     for msg in os.listdir(outdir):
         with open(os.path.join(outdir, msg), 'rb') as fh:
-            msgs.append(email.message_from_binary_file(fh))
+            msgs.append(reorder_headers(email.message_from_binary_file(fh)))
     return msgs
 
 

base-commit: 45ef591d2fb245a06600514d8df57ab64d519fd8
-- 
2.29.2


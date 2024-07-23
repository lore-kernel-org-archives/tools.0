Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A63215252F
	for <tools@linux.kernel.org>; Tue, 23 Jul 2024 09:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721726654; cv=none; b=cl+2Tn26jt3lMgFQ/6TXcWe2l3g5Y3vLttlDDLAiuUqiBCc/K+XVg8ekIlMpKTZ64E70YF5ny+dZ46uFczxGd3zi7Imzs9Z7s3fjKNAeDAO1L4ETCsFW/3LkLumVKNBIS0SRloyN1ZYd8VeBHlIVipMZLum98wfhTAHmBZLj9Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721726654; c=relaxed/simple;
	bh=0NH1AK1Qt56mMTUJaxW1iyik5HlzUlLrJIht8H5oTNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RSajJXuVmRKcJWoxuTpr+FgJ6qgV/mJAMBOL/AK9tw8VQB/uO6LXsNeVJYSKB7Y25y/C4qoxI5VnJwwSAtbLaUW7tMDxXoHq8Zk/QBWyom/7hiNa7qau5t322SR7w98f48QXvs5s4ZEMsvwY1o0p50TNdC9H9pEUpBcBvHvK5mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmsJFvaI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmsJFvaI"
Received: by smtp.kernel.org (Postfix)
	id 1D463C4AF19; Tue, 23 Jul 2024 09:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05F7AC4AF09;
	Tue, 23 Jul 2024 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721726654;
	bh=0NH1AK1Qt56mMTUJaxW1iyik5HlzUlLrJIht8H5oTNY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QmsJFvaIpxdinn6gmynq4HbmedfR3x52i2GV0CBb+LOuzTpaT2QePV0NxCrXUKbaG
	 M/UbCsKTrW6gYrfo8rE4y/u1ZVAZCcwxXKCDaNOhsf6k/2wYUl7P4L5IunjTmMIfYk
	 rLPKr3c4lq+EFUokbNMuV/CWDOQwjI31EnuT5toAweCSYv71Lf2H4cONx4j7/2338d
	 4qrhoRvGK0rah5eqcNkkgdcKMUb/VM/x6XefHLZp+CwW/e2ruZvLT97EhbuCBn6tuE
	 sjBrA88xULPS28lxUi786d1QMXF6b2PQKwAwSJ5vD1ODuPCmhAZCBl2wU8XhgoObDC
	 9f9CmOp15dMIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB928C3DA63;
	Tue, 23 Jul 2024 09:24:13 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Tue, 23 Jul 2024 11:24:10 +0200
Subject: [PATCH b4] Forward the smtpserveroption to the local command
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-master-v1-1-52a11f4a96c6@samsung.com>
X-B4-Tracking: v=1; b=H4sIALl2n2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyNj3dzE4pLUIl1Tw9TUNLNkA4MkwxQloOKCotS0zAqwQdFKSSZKsbW
 1AI7rm+xcAAAA
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.15-dev-02a2b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=uG9WTIKIPuvqQDWXZefXFQZHYlIkkpS5tqQSEO+u3eY=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGafdryHrWbyfumkJMkFwvkJ9HjzM6PrL7VY+
 CplRYRjTeeM34kBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJmn3a8AAoJELqXzVK3
 lkFPwjML/jBA/5apwQXJ/T3vW5ZUvV1F1n7ftH6w/07XixSQsST8S5mTnWNhCsmf90cCOIc9UHW
 AawEYGr2cQKV2TcU/I4YF65ksv8kwi2VL6hoxk8mtWrIbHuCVlQiiZ8oTuLH8zSU37o9TcCb+VL
 1vb9dw4Te4EhIfkolWJm6fl7AUwuf6sVJuTUG13tChYEI/bulj6Y9QmpbEvU9jPFPGMyuRfElta
 jsjhDUzvO1gRNtJBm3JVM2N7BDrZy4Y6P6mrghpIIFt4urJ6+RDu2xeDH12LANofUYuSeNZG426
 MmF0fflNYyV2ZcDBd+rI6kxOKdFk92Mra203/yj8J9QiP+IiVuLA7sxC/kl0Q1qBizbCgktqmlK
 nUBXHdLB7tdF0N3HBEpA74mZRt6XolrSbrvmCPRVs5OaqEDssHIW7N0fj+qhKA5d+z3q5PtMp0z
 Iq70bS4q/gQyKIcK4Px7BuCo2jocypTwx8kXGpxWSlkj3rWggn3CCZ3C4JB51G7z4in8yy0yo97
 JE=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with
 auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
Reply-To: j.granados@samsung.com

From: Joel Granados <j.granados@samsung.com>

Additional arguments to the smtp command are needed depending on the
sendemail identity. Append the additional arguments in smtpserveroptions
to the smtp command.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 src/b4/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ae15b83..2b1a058 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3783,6 +3783,9 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
                 envpair = email.utils.parseaddr(env_sender)
             if envpair[1]:
                 smtp += ['-f', envpair[1]]
+        server_option = sconfig.get('smtpserveroption', '')
+        if server_option:
+            smtp += [server_option]
         logger.debug('sendmail command: %s', ' '.join(smtp))
         return smtp, fromaddr
 

---
base-commit: a95708143ab35fe035ce852b72b94e68bbcb4f58
change-id: 20240723-master-51eef6c00b1d

Best regards,
-- 
Joel Granados <j.granados@samsung.com>



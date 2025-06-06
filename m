Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1A323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239486; cv=none; b=dOwiUMnCzrMipnhr9gZnLEi868pP5ejGHGdjz9Afx2iHBjWd0t6xDDM0U5bqr3kpzBcXKzNoev+9yWG+YVIAzxkj0xWyP9/kZiK4Gwcyz2w7b6+6biDTxS3zZWA3nxvS1z4S5Dj/OwTv1GmwqcIhzIwus6qwg5n6bk69o1GUISY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239486; c=relaxed/simple;
	bh=KaZMox43iPTcER9KyYzaDcwyIaYkXQSozDBxKQF/9JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BylII/PZ73oD34nuliRpl2C/Qd0NFUqKUPok9FYqOjt0AFvv2vrTFf9LGsKsNpXY/puA03Gp7F9jW5Tjo/jTzW2oaaJL62Uv0xeTR5t/4gfWViyIT6lN5z+4Rm22/lHaafdS42kb/ZeBS6w2MakoxmYUjI6nU6jnT03LGL17g+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CY+y63KQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CY+y63KQ"
Received: by smtp.kernel.org (Postfix)
	id DF187C4CEEB; Fri,  6 Jun 2025 19:51:25 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBF26C4CEEE
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EBF26C4CEEE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a5a196f057so47119681cf.3
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239484; x=1749844284; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRwEqC6qFo5Zwp5yj6ZhUM7gq8NPQpFRI8gNb4ko17M=;
        b=CY+y63KQZQC5zPu95feNql76JQ892LI1PZQNcMITVcLN4by6MriowlDLFgTrw/oL6G
         CCpWIIpPdKVVBXifHTWFjjNS5dpEcH0f5Y0hbGfD53kcK6XjdlPVzG/nCn6EXXIDsmAc
         yf141LJXbyRoj5LLOUFBpcl1fXlboJ3Szx/owgkLUWnMFKYRMlXpP2aJhBvMmkNEeSjG
         R1DXCBW1DyyYGIxdG74z/xjQvgqCiL2wes9aiEGp+vydensG7Nmk236eIDeqr24AmSwJ
         qybZxWPAOZZIVBCBnrOVH586UGY45Lqv0iDoCWou2svb8SIb+Iz3Md9jVNyRKm7EFzsM
         gRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239484; x=1749844284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRwEqC6qFo5Zwp5yj6ZhUM7gq8NPQpFRI8gNb4ko17M=;
        b=gERvN9ifebFKijghiUXESxtLyJ3+PNHMWF6thCNevngon6QiDzH7NwNGe0m0uWUROI
         Zex6b0UfMfYYd0JG7HD1Fq6QvsLZcs9pBWCmR3l9PerLdjGEDJEetLSJwyorqf1izCQr
         1cSE3yq9X6NIsLM7UoUZ3wzwpzQJy6wdG2/f2ITzg7zB8eEyA1xQwikro1qJ3N4A71q7
         bwu7PrBr8TOPfH38RKSlzDeuLk82Y1Sn87TI3fi2g3+BbUaWWwV07XISmU55LnVnceHl
         s49HeW7dS+x0VaJgdcK7hRdrstFEeAPNSxVplleFRul7s6lo0VthcKbtoFKrqDLiZxEL
         vcrg==
X-Gm-Message-State: AOJu0YyEmyU+jsVmDxTp8aewFOvXEBHtgKONf4DJAO4/UGl7jrGzwzch
	FyqZdY5njhIGGHL/5AvRZKeZdDA1xTik6HLch5BdAnjD5gmQUqJ7gjZM
X-Gm-Gg: ASbGncsjiVb9OQmWZtGdKpnAnomsFfHpXs853zqq4ixeNJkrDcf7SwJSYJqib1zoNic
	R+RZBjjx8o6k81G2JXGmpCztYrPo9h63wUk3Cij+d6j98/u7KqGeRP46LSyTJi8KaLr9WcraU8M
	XPsMK0AIlU5YdtVqO5rkvimYF1xNY1ofAA9cuNRtdZgh2SYquC885HI0E75srwxWBBr6Z9GYzy3
	IsjCwwX3623Kbd30/pcJ6yg/NKxISFC1weKH78zf7beuOCcuxCRmos0isVg7tUNMAWQgn0lHM3P
	TXWlGQ4XHJq7w9HQMN7lszzV9nKS2/Yx8r6gkwmjWoiWAdRQ8B1mS5Ub55uAQjZpo2Ltc9Uf/A=
	=
X-Google-Smtp-Source: AGHT+IFJqDJV8lGsPzC2sK5jBl4Cbu4u8wa83nTyENPZB/R9Cx0E+eX+D/f3OJfcAvTtDyYap0ysZA==
X-Received: by 2002:a05:622a:1ccb:b0:477:1edc:baaa with SMTP id d75a77b69052e-4a5b9a01125mr77247601cf.6.1749239483795;
        Fri, 06 Jun 2025 12:51:23 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:22 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 06 Jun 2025 15:51:16 -0400
Subject: [PATCH b4 05/10] Remove `noinspection` comments
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-uv-compat-v1-5-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

I don't see these warnings in PyCharm.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 misc/send-receive.py | 3 +--
 src/b4/__init__.py   | 2 --
 src/b4/command.py    | 2 --
 src/b4/ty.py         | 1 -
 4 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/misc/send-receive.py b/misc/send-receive.py
index d9cd339..bb65aaa 100644
--- a/misc/send-receive.py
+++ b/misc/send-receive.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# noinspection PyUnresolvedReferences
+
 import falcon
 import os
 import sys
@@ -35,7 +35,6 @@ logger = logging.getLogger('b4-send-receive')
 logger.setLevel(logging.DEBUG)
 
 
-# noinspection PyBroadException, PyMethodMayBeStatic
 class SendReceiveListener(object):
 
     def __init__(self, _engine, _config) -> None:
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 2b36cb0..14e9066 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -28,7 +28,6 @@ import time
 import copy
 import shutil
 import mailbox
-# noinspection PyCompatibility
 import pwd
 import io
 
@@ -1038,7 +1037,6 @@ class LoreSeries:
         return start_commit, end_commit
 
     def save_cover(self, outfile):
-        # noinspection PyUnresolvedReferences
         cover_msg = self.patches[0].get_am_message(add_trailers=False)
         with open(outfile, 'wb') as fh:
             fh.write(LoreMessage.get_msg_as_bytes(cover_msg, headers='decode'))
diff --git a/src/b4/command.py b/src/b4/command.py
index 476fc13..5473df3 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -137,7 +137,6 @@ class ConfigOption(argparse.Action):
 
 
 def setup_parser() -> argparse.ArgumentParser:
-    # noinspection PyTypeChecker
     parser = argparse.ArgumentParser(
         prog='b4',
         description='A tool to work with patches in public-inbox archives',
@@ -431,7 +430,6 @@ if __name__ == '__main__':
     # We're running from a checkout, so reflect git commit in the version
     import os
 
-    # noinspection PyBroadException
     try:
         if b4.__VERSION__.find('-dev') > 0:
             base = os.path.dirname(os.path.dirname(os.path.dirname(os.path.realpath(__file__))))
diff --git a/src/b4/ty.py b/src/b4/ty.py
index 1da325f..82a228d 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -256,7 +256,6 @@ def set_branch_details(gitdir: Optional[str], branch: str, jsondata: dict, confi
     if 'thanks-treename' in config:
         jsondata['treename'] = config['thanks-treename']
     elif 'url' in binfo:
-        # noinspection PyBroadException
         try:
             # Try to grab the last two chunks of the path
             purl = Path(binfo['url'])

-- 
2.49.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA019DF5B
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 16:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745509; cv=none; b=lUzcg1i0CXuwu62SsOhqK1ZEu51imIGarE/nywWCRNAAWazmg9SzMZyPBMlB8XJTtyPdEEhonZePEg37dZ6vM+uAg2n7HvPzqVJr7QopnUKfWAL8hQZSFOrbPfNMfQr5ZOKRGBnPCl03/P69yQBrwTEUjuXtc3CuZTS9nzxKvKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745509; c=relaxed/simple;
	bh=8xS9xKQSzVskTqZsGBuneqmTr7VbDgeL7dV3TDD/kQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qTpXjQextFrXOzukqsng6wuhcy8Q+43TOmGn6QMKlOeOH/KhcaNmPxoojdUcxq+mVk0K3e5LfAdA5YuJVtV/k/cH+xVxzWFf+h+ia8RLVTF9TdSULGfagKhlk0b+Jxpc2RYbf1r2LtaFBouxXlkSZWKSx9eMAXp0Ho78c/DAaWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEvnQP30; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEvnQP30"
Received: by smtp.kernel.org (Postfix)
	id 9789FC4CEEA; Thu, 12 Jun 2025 16:25:08 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF871C4CEEE
	for <tools@kernel.org>; Thu, 12 Jun 2025 16:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF871C4CEEE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fafaa60889so8354216d6.3
        for <tools@kernel.org>; Thu, 12 Jun 2025 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749745507; x=1750350307; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmWlSJEwNmqIc+wHugkj9enj9TQ7/RLLRPNK04g2SDI=;
        b=DEvnQP308T1NEDCCsCf7gPbuCeAQxC/dPQbVMhRzZpHy071kinFR3K4GhiJEPC/zAo
         b/MWRk9N/X1U4r4aJGhtq7XNGpLPBwJUpA1nLEmSPxFHr0SOHWilOgrB4LGck9kfdsjX
         iOqscvjPRnKev8o0CF3Phbi+pASFJjmgkiIkndFmWVbdij24X/knhpkv90QE87+YVOrm
         wbi/cl/1H6tXOY8R5p25sO2Gj3hM0Y+RT8ofe3ZPXJtoUV3wN5qbMwpKygOFyHhzICiV
         2AXMWkFIaPd9Pux7JMcq29OmRXhMfPBQTMZRn8z6CvFRyDdNmKJshL33XzBYFdbefAgI
         fN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745507; x=1750350307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmWlSJEwNmqIc+wHugkj9enj9TQ7/RLLRPNK04g2SDI=;
        b=sOZBnRUfv3bUoL3U+GiM0ddNPAuP8xj0D0SXOwHJhE0PfQrQ4efBxsqryoGVJRaQgV
         q8l+fWQjgE18xsSjRmjozTd2uq+UyoOLES6qhvF41bhJDNLRS4zikwBP4phPznleeqIf
         Nn7Uwoh752+Subsngf4Ijcq0gN2tVm0xbf5P6uiHUTTm+q8SvkA5qc16MkLxQkpC6TXm
         f9ZQdAhI6I/kQDa+JRXqek99VbDLygFmxEeMzkBEIxXwlnaYs3vnoinH2of22OypokJp
         YoBMeEGnY1HCFdULLsZcBg0fn7rFIMy1IIY8G3C8MowjZ/xWgNw1OMMvY8DuP786uYk7
         3JjA==
X-Gm-Message-State: AOJu0Yz7yhYmnTCfd7H2r8RrQsIo8jfLmyd8ncXCU339QIRFxqvaakh0
	Z/C9eSqgxn+2LYX6D3rshMx8VHOTYkfrI10fLIvPSs4jwszLVm66rdDb
X-Gm-Gg: ASbGncs14rTCm1mCnemaObUDIRWFklJrmjZRF6kC3RbvlqI1VYojpj+517vRJ+/DBDD
	5kIbDujjjiifCpBR6n+er2fx7keA0RMGbUaRyWszgrz7K0brV6Ng8jbXmUeK/zyg59vyLh+XEVn
	fNueghdtudrJ/M/Fwt61dznh0YQ5Gsp4J6D2iQ/4tnN/WkeGAEYZRvMZgIhHNz7YKbKPTGPwpBs
	sARpITXnWYWaaEbmDLpMUN8nqG2DJHN5vTDW5lBKyzgZQ6WUfR6RMnkMYDDZJohQOpvY96prXzB
	rfgzcbxxt4eJv0ymN5pTIsXU9bCE02HnRA3XpSTRup4NW3n4Orzn/pvE0iggH9nhdNU=
X-Google-Smtp-Source: AGHT+IGEBsMASFcfF+asM9mOtSX5Ws3JTnN2xOg+8aXS4rnbgLSjhMLpRN30vPNQEHCJGv8OkP+XkQ==
X-Received: by 2002:a05:6214:401:b0:6fa:c46c:6fa6 with SMTP id 6a1803df08f44-6fb3d245904mr4415506d6.12.1749745506497;
        Thu, 12 Jun 2025 09:25:06 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([204.93.149.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20f72sm11996486d6.23.2025.06.12.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:25:06 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 12 Jun 2025 12:25:02 -0400
Subject: [PATCH 2/4] Plug subprocess FD leak
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-better-errors-v1-2-3aa1523f6d8e@gmail.com>
References: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>
In-Reply-To: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Use subprocess.run which avoids leaking the subprocess.Popen.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/patatt/__init__.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index 7785248..12bf06a 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -786,10 +786,10 @@ def get_data_dir() -> str:
 def _run_command(cmdargs: List[str],
                  stdin: Optional[bytes] = None,
                  env: Optional[Dict[str, str]] = None) -> Tuple[int, bytes, bytes]:
-    sp = subprocess.Popen(cmdargs, stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.PIPE, env=env)
     logger.debug('Running %s', ' '.join(cmdargs))
-    (output, error) = sp.communicate(input=stdin)
-    return sp.returncode, output, error
+    cp = subprocess.run(cmdargs, input=stdin, env=env, capture_output=True, text=False)
+    logger.debug('Completed %s', repr(cp))
+    return cp.returncode, cp.stdout, cp.stderr
 
 
 def git_run_command(gitdir: Optional[str],

-- 
2.49.0


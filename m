Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E6E1E47D9
	for <tools@linux.kernel.org>; Fri,  8 Nov 2024 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069149; cv=none; b=m3j4mMy89SUFdaF/ihBJMNvBTz1Z8TXPu3AOv/SdbJPI9IurY38ZxbRrPMcZ0fgjANYO11ZSyVj2zcOvKStsLGRIyW+cg5LcnwlHZpSTKM9YlGYRbannpT6yH2gqAgP44jEyrQp38PeStar5+ZRgvARdUGUWTlJnf530MbGSAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069149; c=relaxed/simple;
	bh=0awfLOppbvGuE+SGvpO55DBynubQv/bhicz7ZPCvabI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwsH8EK94RIt4t4/tjL6kCcdrA2IcnO8U00HJcg8R0RAIEUsvMIoXn7tiV+efZIoS6KVi4uS1wGq2do0Cyrm+pr0aQos8YWNBreoGq9jWYB3LdTJsn6vuPoaw5DTFAQpwZbqn+oHXDGC9JTx8nv/76M7DxTrDn1e0SxY72UoWLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwahPP6X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwahPP6X"
Received: by smtp.kernel.org (Postfix)
	id 5CC78C4CED7; Fri,  8 Nov 2024 12:32:29 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C3DEC4CED2
	for <tools@kernel.org>; Fri,  8 Nov 2024 12:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C3DEC4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b15d7b7a32so144867485a.1
        for <tools@kernel.org>; Fri, 08 Nov 2024 04:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731069146; x=1731673946; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4umdQaNw/jPh7Bv7a/9BIO1YLuzyeQcqvgA2Fg0Q7A=;
        b=EwahPP6Xq5glHp1qOnmyYOhouj7RwxYeSdQ1oog9gqRkzIzFy0GDzpdiSBK4+X/Mt1
         BO5enaRk/N0sGtib21cCOEH+7ZIPin0ICsRBLUXE9pufdM3b3eXRbsLaGfgZOdDF05bJ
         4iVlmzGuhk0VP+u5HWlJUDOcMKvNFEz6/vsSWp3ZLRMYQ9RpZKM1c74WNuoUahVFModD
         kXFFAlBacGcQiFgaNhR/La+VnFkSZQhlxWQx8dXvw8e8QToVhkuvRUympbxbpRHYj/XE
         TLLoDgzNzkNLHPCvF21zmHHWP8WGLSlMMIYSXFW5BfrPdzIIER25NXITKIN1ZAKEc1tp
         CC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731069146; x=1731673946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4umdQaNw/jPh7Bv7a/9BIO1YLuzyeQcqvgA2Fg0Q7A=;
        b=oHkVl9ThyP0zRsoB+CcrS69pwdj/8FTwOzlTB06MBcZJuNZuj/SUhEt/D4yIT8c70Q
         R6CeUooFs4drHsj05WIIsCeKtdyBtyJx7GWuuo9YowAsXJ+PCqgwezzcD461fsvtrpSn
         3D65IrGc7Hhc3GEwmKg47pW3Bxe2N8SBbZyVVBEKNYmBW2Y4JklNCU7Gdo8TmgsTp4Pz
         VpB7ZV/RX1bC5VTiHIUAufqPgYmLP00AJ6EhDXGgclzBIxpmVNylULHaHD32wfBBSWCB
         Hyj6WXPksgH4ROHvSjCSwJNOE0hQYL01nN+DqtdRopiqfxDgTfD1SjMRe2wKbbqvi7hw
         A5FQ==
X-Gm-Message-State: AOJu0YyI0E5vPTlrj+foP9Q+ZCRvzwMNbms1hU7PL15/q6weuVyNJiRu
	MEao6BIDE0uOVH7py3CBuxJpxxvBimlkp9OeAcPEMP0V2gZHHJto
X-Google-Smtp-Source: AGHT+IFvyqRjmRvvoC+zcZXGOuh9xs+7/vSs5HBru1VbyPu5rWy/J9QkHg+rc+rqIo9cCPlg8Df7NQ==
X-Received: by 2002:a05:6214:54c4:b0:6d3:5265:608c with SMTP id 6a1803df08f44-6d39e1077e3mr26328736d6.3.1731069144747;
        Fri, 08 Nov 2024 04:32:24 -0800 (PST)
Received: from 159.1.168.192.in-addr.arpa ([2600:4041:5be7:7c00:348d:4cbf:ba75:f557])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ef48csm18633436d6.35.2024.11.08.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:32:24 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 08 Nov 2024 07:31:29 -0500
Subject: [PATCH RESEND b4 2/5] Avoid file descriptor leak
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-better-type-annotations-v1-2-ebaf0129d9e1@gmail.com>
References: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
In-Reply-To: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/b4/diff.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/b4/diff.py b/src/b4/diff.py
index 63e60f2fc82c95145a897c2dd319283996ed5a8a..743127ef0a1922eace81686e27cd0366f8e42f9c 100644
--- a/src/b4/diff.py
+++ b/src/b4/diff.py
@@ -174,8 +174,8 @@ def main(cmdargs: argparse.Namespace) -> None:
         sys.exit(1)
     if cmdargs.outdiff is not None:
         logger.info('Writing %s', cmdargs.outdiff)
-        fh = open(cmdargs.outdiff, 'w')
+        with open(cmdargs.outdiff, 'w') as fh:
+            fh.write(rdiff)
     else:
         logger.info('---')
-        fh = sys.stdout
-    fh.write(rdiff)
+        sys.stdout.write(rdiff)

-- 
2.47.0


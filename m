Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3A9257AC1
	for <tools@linux.kernel.org>; Mon, 12 May 2025 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039172; cv=none; b=d+5Uh31IMKDUWTZCFvpJXLmFANqjZVC/PSyiozGwHC9qB9GN99AslFjArbfmyDTnMkCGQaut9FBNrWh1XAW7rt2kAxISpO94C3xW9p7TQjoBVwrbOqXm930Qnx16viJ6ll0YV0JIfUC40M8zqOGrDEIvi3VrUOW+lxJfui4d0UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039172; c=relaxed/simple;
	bh=OSzqDYany5TZyR0bOnR13fMzaazMMGnlSnWeCQMWPj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7ClyLJ8n2K2oBXujFsgBAtBgV4+rh1ckg2nlwODx62KSPDtN033yAOnKd9qL8rgZlYXL9ZKOQKo4Rt+6HPs3QvD+l+9MdvENJ4wbx+U4GrTgJP22XTl4y2GFUVTkp6iDHnQkM0XjSVtyoi7pbXYwakSSp9TZfpgfOvgwXPyZNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KDbTv80x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KDbTv80x"
Received: by smtp.kernel.org (Postfix)
	id F2EF8C4CEEF; Mon, 12 May 2025 08:39:31 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8A27C4CEE9
	for <tools@kernel.org>; Mon, 12 May 2025 08:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8A27C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so2162418f8f.0
        for <tools@kernel.org>; Mon, 12 May 2025 01:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747039169; x=1747643969; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm9GPHeGzLk4W5sM7risumuCy3KCkL4yUFmPcDXFPvc=;
        b=KDbTv80xGoXiHUAwel8aJWn7NMvpEFK+6y7mfTDS9zmXS+7HCVjC0+l+P7jPRS+dAz
         HJskz8G30Q6b/snaEuWEzZEYkswZQfC90K6wCXSSZcVqS1xwbcjP9yis5XsutSiAerF5
         +R+3OzFjj+kZCPkR/L1wwM5KUnuZWueCBs4LBcGpVKqmEq0jkm1NGo6ZWjDJTQqprO1M
         WDX6TPWVGy0P3CjU459yCNDCteiaIoiDz4HaajVbA6Xbt7RU0Cd8adhT2+t9wbHDVALD
         AU5WjYCGhprR6o1Z8ojMIqZXs4jgJNtXAmr6UsfB7qHq8OVKSYLW5K9TqfwPc76JTyHw
         N6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039169; x=1747643969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mm9GPHeGzLk4W5sM7risumuCy3KCkL4yUFmPcDXFPvc=;
        b=co0maEZ4uBARfqfKz/j6bL0HG/fDvFGFZC2/pGK+vECYGRfGk8zce0JczqT4Sf5HRQ
         BPTrb3id/a7Jw2LufDusBtgjI1ubgNcWnFR2+3W8BneKiDXMNHoe0dBhtcCQ2sWaHi7O
         1nZrt5haqffnxEgEFEeA99rXC+lFJFch7iKRWSj4BRq0+RMpa5VUk+jLjYCYPee++oyk
         35vE5D+DTOBkYQeBCu1sVB0EXvV/gixWKskZFQGD6WAv9hqb7zTcQwTecbR7Q7OGLil/
         32yyPsIQfZlF1PxlEmsmuXStu8XPuGtJaKkx6S2IJLHuMl0fp1JFNf5sBlP9MIG/lOUk
         jtDA==
X-Gm-Message-State: AOJu0YwPo1n58Uz0e8WfiSqc+0PRT6dfAGmh/wEPNhz2bi1eu5iYBPLx
	IeETs4MSYCjODth8YWQgFp/+61mBgie8xxNuFFivSvnlyV3hmQLYWWrnJJCEwWEKnP/vUvThyGo
	6
X-Gm-Gg: ASbGnct6nb8M8Ll5kKpDs1YXgTYhTT8ZsPOah628C6hqKt2V8mPhD/m4/3Jv7VqgipD
	FkkUxqQHSwgrxQ47qNMTW/rXqYjBIOgf9BSfB0qrbAj59z3Xx6meoI/RFDRPnyAAenVBq2HgBGK
	pTnOqeklnzeaNUp+wkptCsMlDGvkAe05l+Ae35JYo9d1q6HEhwurVVqVcCgfQUQu5Rwas1olJFZ
	YJML5e54g09nu42iFibcott7/Cme8sUJskgMQKi5qyqp/+jPSriloO4O6+aximLjIS/j4X1mLll
	RKkh2XhjkaVILuipenF+RL4Hz7a8MPohoQlQJckr+lTQ+ItQomYEHByspGBl+MkZdzWkyW5mel+
	/Xm5LP1tVP9eTQEiBjg==
X-Google-Smtp-Source: AGHT+IGBj+nNrVWMtkrc+9ixuu8mMXprnBcRPhTgQejblonz6ASrEA6N1XYREjjqkAjo/8lmHSp4Ag==
X-Received: by 2002:a05:6000:4205:b0:3a0:8842:f7ce with SMTP id ffacd0b85a97d-3a1f6432215mr8532460f8f.22.1747039168688;
        Mon, 12 May 2025 01:39:28 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a2ca47sm11714616f8f.73.2025.05.12.01.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:39:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate v3 3/4] export-keyring: Default to store "clean" public keys
Date: Mon, 12 May 2025 10:39:06 +0200
Message-ID: <e9a1735595dcf898f44040b3b47c33214a9ea16c.1747038870.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747038870.git.u.kleine-koenig@baylibre.com>
References: <cover.1747038870.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=OSzqDYany5TZyR0bOnR13fMzaazMMGnlSnWeCQMWPj0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoIbOvHWxDs2LhkQ8aB8EPozwiyIoWSzyMIn3Sz u3E9SebFyKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCGzrwAKCRCPgPtYfRL+ TrfRB/9c/v0xltWd7aBtae85meGJcSx7BA93LJUSCpP139KL09e5estqMb8++RkQdc1315NO53R tHVNt/rjgGDQK77tObiNb+Ul2RES1RGVKYPfWVcy/ZERwKwwn//WaPPvCylOfVUdR/juwhXFcgH kwAfPtgYrAeudvs0SzgSpOvXuhmCfVdD9ivZ8CDMLSgcD4vkZIpVPRCpAFcTMG+0GMrTxDMoLgi FodtYS8/YjhW5S39ky70Nzd9PQ/kufNphZWMpgrIrERtBtsCJ6EEWNGt8leXw6mC+C7oWHk/wz0 zFoOw+4E4q8NgluQO4tZ1W5e933+nPNbkQFl18Zyx5jXE+rQ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

There is no need to keep duplicated self signatures and signatures by keys
not in the keyring. The default behavior of gpg seems to have changed
regarding the first type of signatures as commit 671a0c921fe0 ("Periodic
update from keyservers") in the korg-pgpkeys repo introduced quite some of
these.

New key material is also only added cleaned, so it's consequent to also
let export-keyring clean the keys. A side effect is that signatures made by
deleted keys are dropped, too, but I consider that an upside.

A downside of this change however is that not only duplicated data is
dropped, but also 3rd-party signatures over SHA-1 hashes. While this is
good in general, this will considerably damage the Web of Trust in the
kernel keyring, disconnecting 483 keys from Linus POV.
---
 export-keyring.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/export-keyring.py b/export-keyring.py
index 5a30f3ff6927..63e6a49b5f3a 100755
--- a/export-keyring.py
+++ b/export-keyring.py
@@ -51,7 +51,7 @@ if __name__ == '__main__':
     ap.add_argument('--graph-out-format', dest='graph_out_format', default='svg',
                     help='Export graphs in this format')
     ap.add_argument('--key-export-options', dest='key_export_options',
-                    default='export-attributes',
+                    default='export-attributes,export-clean',
                     help='The value to pass to gpg --export-options')
     ap.add_argument('--gen-b4-keyring', action='store_true', dest='gen_b4_keyring',
                     default=False,
-- 
2.47.2


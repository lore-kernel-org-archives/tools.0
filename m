Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9361CD213
	for <tools@linux.kernel.org>; Fri, 28 Feb 2025 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730138; cv=none; b=MimrGa0FKSCbKaBDSlayUnumkGX5Xb7n2pGRZGPmjWaFGVSmD5vgXtnDyzQxZ7b6/iUpZl4DkIfUCvv3nqcuNJH4khVfx1oAK8PqdfWEnibWo0kbw8nuilD7qKcifSufK0zzY98NL++lCWPU9jPMg4RgVFmsAV++I3e4WyLYRjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730138; c=relaxed/simple;
	bh=QMN09lkHsQ+c7jxaiLgNlfFdPUvebxSQFaXqVTb6pUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qo6WQqYqCSB3BvbXhs7/3mPmmj5sYhi+TbAU8pp5mySRCJGrTEFUNcQtqYUJGocyRgMRVwODsrjMQhPgNspcwmtdzaR5Ju4wJX2JZwJsuYMq6n/7l4Q357ZvBl/OEOWDbeKnUdih4Lo3pWc+8QbjcKyMVSHVNRIar2I/n5Zuqtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=or1DjUqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="or1DjUqX"
Received: by smtp.kernel.org (Postfix)
	id 069D9C4CEE4; Fri, 28 Feb 2025 08:08:57 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1116C4CED6
	for <tools@kernel.org>; Fri, 28 Feb 2025 08:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1116C4CED6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abb7520028bso243074366b.3
        for <tools@kernel.org>; Fri, 28 Feb 2025 00:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740730133; x=1741334933; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xcYGqYyy6QWwpe5T7VGPm8wMHDKXs1YmD/WXEDIUHuA=;
        b=or1DjUqX2OSrhUbp823xFJdOsJHixsYk8T2TVAnh4c/AiLMHmlv52N9AwDrhjaUB2I
         WRTIIjDW3N9krZXN4nuK6VUry5T72Vfnp+40UEbn53RvpAI8s3bz8gBygq0XuFlsiQ7i
         HefXcarjSmBfNTlmA2ywGctr4MG6woUt2rszcdciB3VxlM667oNoFuDgx6dlTL/COHh6
         /6bh5MyjklBKb/10zBmHmWGX+C2N9AGTTqyQy4Ew0r0ljefYuwJrbiN8Da2WMvRvejeT
         S/PVUYANql+SX1GbbnM30nIxE+QzmJlyizl/ltgHb154/uXPbsiySopHnkLAdmPMniSX
         NGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730133; x=1741334933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcYGqYyy6QWwpe5T7VGPm8wMHDKXs1YmD/WXEDIUHuA=;
        b=goQ+lsZDtQSUjTKcusml2oA4GbPBR39wzn5C47GmzrtjmAW/biSKneYG4QZJfRskyb
         ZT2eReWxJrYfEVJgE2Ffi5k6GmRKBeccoifNkuaJDkBKunW+72v75PKMgyyXnYOLuFg2
         rcdX1xKC5r8Kz9rbDh4C8Pt7jBfaTZW9yCasQaqGjowqZiROBNJQHveDbFK42/IzXATq
         4DW8RjC2YfJ7p/DqVzOOoGKD/iLdq2JkTjjD+f5ZN5GZZO3VHdQ2zUwav6nq4c4vPLkx
         qkB4hiqYzz22Djw8dPw2rCO7t722e/bo+XsrR7QLzV+5+fPLAyHB39aA7RdjPEHi9Ckf
         IV9g==
X-Gm-Message-State: AOJu0YzEMMUw1jaVbPnJ9C+e/mOzsfo9//7cjOIjfDHUF10LnOyiyjZZ
	E84Yy2i2mldPg+7iZisf4DwA5WNF0oGhnVkcpuez3nVzVBObBcE40EHCZwWMr9k=
X-Gm-Gg: ASbGnctKmiEg1a8YaE4+a1G7gx4pGAwsQvwevsjibHn/M60gXXSn8VbfQFT3L4KYUn2
	q73YcOPFY84kL7KwdAopXOYAifhtDmWMhwRNzIyxFDilfYSQscDCieLqesLPsVh9Ci6A4byQeaP
	7X7g32pM6rEOhCPxnfnuNMoHe21KsP1yVUo47PSdPIcrpK1YSYKHb58FIs5Ra9P3pDSeTDB5OtF
	7MqcLWLNncGcjBiQZEZHFZwhMET5NTPMSTndZoJoN2GsOjU2eRiWy86FXgl+hLUaTX6abzhv7QC
	7hixVFbwZNtNkAgz4RdfrIYY6/FhflsUFbBdXad0s+RLmvcCFjeJkLhWlGz68G00
X-Google-Smtp-Source: AGHT+IERJR+p5VSthZXpTxZqha3D/34M7ic0KxM9GbNeVB16lJqd/R2Kqo/gdLZrtnkdW6omMVgzlA==
X-Received: by 2002:a17:907:3f9d:b0:ab7:ea47:ded1 with SMTP id a640c23a62f3a-abf265f9f0emr230001266b.47.1740730132902;
        Fri, 28 Feb 2025 00:08:52 -0800 (PST)
Received: from localhost (p200300f65f2c000400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f2c:4::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6e9c36sm249235766b.111.2025.02.28.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:08:52 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH wotmate 0/3] Some wotmate updates
Date: Fri, 28 Feb 2025 09:08:36 +0100
Message-ID: <cover.1740729275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=QMN09lkHsQ+c7jxaiLgNlfFdPUvebxSQFaXqVTb6pUs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhvSD+cy3ZGb/enfP63wq64ywh8bt7N0dooVfA0LtfW0Lp YQjdjF0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCR7fYcDDPrvbL5BHzMzgqI 3uE8UzoloZJpu6iBtKi80RtXHv2O1Yy2T41nBBTy5ug+XlDiXOimHdTJvvNT8LkzaV8Kbx9gu/L vY+zq7K8inrFF35juz3zwRiGRtX2Gpv/KcqVCryC7BX+b7hj+Thc/XbTx/K+t9xW2Se7Zed7KMV +z641i4bd38ue+mn+P2fp387EpakopH9YxuSy+6rfoRvLfQEuTKYavzcX7WGacCwyqzGFeoGFaZ ft3QwerkcilAv2cVxzMN36+NhV9t3/OloJGm3Wr89oeTm1ZkCxd0+fa8o6lRqjmwDbh0p777q9M zrLlthl0FG7NjbjkcazSmYHt+rRXqpu5vbU49s06fqEeAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series consists of one minor fix, an addition of comments to
improve readability and a tighter check for key updates.

The fix ("Fix foreign key references in sig table") has little practical
relevance. But it helps a bit if you look at the generated database with
sqlitebrowser.

The stricter check for key updates relates to
https://lore.kernel.org/keys/c7klbj6xvzcfx63gid5iancjg6cv4krgm2wk6wfijwebq7bxtr@songleund4fm/
. The TL;DR; is: In the past SHA-1 hashes were used to bind subkeys and
uids to the master key. Cryptologists consider SHA-1 broken since 20
years[1]. Keys making use of SHA-1 in that way can be repaired. The
procedure is explained in a follow-up to the above mail.

Note that this check also fails if you don't have Sequoia sq
installed, which is IMHO fine.

Best regards
Uwe

[1] https://www.schneier.com/blog/archives/2005/02/sha1_broken.html

Uwe Kleine-König (3):
  Fix foreign key references in sig table
  maks-sqlitedb: Annotate fields from gpg --with-colons for feeding in
    the db
  export-keyring: Only accept changes that please the Sequoia linter

 export-keyring.py   |  4 ++++
 make-sqlitedb.py    | 22 +++++++++++-----------
 wotmate/__init__.py | 11 +++++++++--
 3 files changed, 24 insertions(+), 13 deletions(-)

base-commit: a9716d31c7f8f2419d2a88c69dfedf9cda3e80c0
-- 
2.47.1

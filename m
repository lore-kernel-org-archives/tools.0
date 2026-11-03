Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793722881;
	b=YZReAYn46AJ87lymet1fFl4F0YXasN9L5eU4c85XgDACzvhXN8akwlQ92IzDP5Ze1qVe
	 nSu8g2B5IR2HFy7pB8LMRdl7kHa5Ie4q64pD0Xj5YHcxkiqgEI2Wz1WQOig/kxw/Y8qpS
	 djsNEdQuL1Y3FCYuq4iwOIUKSne8YsVjYjpveMWuEqeG/mmx3ZV6WUjI6Jp/DGdzpAP6Y
	 8zZq82onMq89p4rpnXmeMKt20WrlGcnTQcBXu83nv/YoBF98FELVa6CemWEkkHFunC59n
	 EqhFQ54HWggHn4K24icGIqxP688q6qyFzdopE0aVFHcJKqIG9RYwAEmOMnqWfjFTkGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722881;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VyyXpKVbfO7QlnOVzcwHbjDy5NQCQYfozNetgEWlJ6k=;
	b=xYkM2UXQcdhwqjsXfRNRJ6ixO7UwjH4MFu/LJmT+v/14qifVkfIYBOK3jboGQigHtx5V
	 trqo12JxN049mViX8GGxR3A3JbNce0U67dn3/Bjcu9Kyq7c7HyMzUbNWMbxXYjN7XTkgZ
	 eD3M5vKoIHTGVsM2VQ787gO3DWtZ84qvxI2fUUfCLlazpWjM5GuzpPHzI7/pp4faryZlZ
	 Y1ULNnE+n8cwvZscL6HtuFc7r9VD5cW7bKOm26NzT599L9TupnrYhMQNQFTVK/JxK6tk/
	 Xh4+bVGoUVxVyU7EglFDQO/wWkbi0CgpUOaW2u5ZAY4zspzsgEoshzsizQCrB4OiHzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtUg970D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77296606A326
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtUg970D
Received: by smtp.kernel.org (Postfix)
	id 2EEDA1F00919; Tue,  3 Nov 2026 16:21:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793722881;
	b=VBkMpVZGdzX18P6yUWr/s3M6ykzGbUD0k8f0BEh08jDdAMt+XzLW+PBj9wGuIv23UI3s
	 p/0RouLIth3pv2Km10AItj8yMTFy1RbdTLnB8shGaWUmehHR4NA94Nx7X9xQx/55sWx6G
	 h6Z/T03XqxnsU594G/+/SoPJFPhDA37Gi6c8MHDQGiduh7TOhWJ/bwnJI+aLGGZV2gRS/
	 j8nZFKZY0lTbXnPg7CwRqbayIhh5mtyn+k76CWEtSEagsz3LIX8k65oKkcHFVash0Vu1B
	 iq8uqvKsdlIxmwPe6FfAD8Sl9gefzELFEg9AG92y97vUg4mjf9ppAGeb1psPC5/OIAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793722881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VyyXpKVbfO7QlnOVzcwHbjDy5NQCQYfozNetgEWlJ6k=;
	b=YQqzACzCSkKL4w2qaj4QrOsHPuBPvbA/SIhmoUYdBYgNmyIoQA+JCi170nmM+e1Z27RM
	 2iJJ1yr3bfIO5kmXSOeEmjEmCFHJz7FklLGjBiGHZB1sNfo3I6YQzEnQz4cGRlJzQBC4x
	 y8jkinitgbEUXm4fgxcR7dVBf1DJSufIj7RiJztvekqJV0WABKPLxlNcEVoHhNI5QST+E
	 cyRm35iYwzYi548aapGW6uRlgEQsfPHodo7KVTaHiIoX/y9/o0iVYqH7GhV/6eS8oAqjO
	 xDOCGk1VMbTTqmSQAjN4upb6vWL8U/NErzs76MVPuQNZBZeCAw8glgfYANpcXnivF5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtUg970D;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 761081F000C1
	for <tools@kernel.org>; Tue,  3 Nov 2026 16:21:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jtUg970D
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 761081F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2591385f8f.3
        for <tools@kernel.org>; Tue, 03 Nov 2026 08:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722879; x=1794327679; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VyyXpKVbfO7QlnOVzcwHbjDy5NQCQYfozNetgEWlJ6k=;
        b=jtUg970DfZ9KsyPIctlgbmW0sDR/so0PMtfD2YBN2h1h3vadBcuSe1hlw7xA0qL6sU
         07OIK9GW1WJOEzn29dR0+EWpoa+ZHafNvhlGRZLAgB/JWL+pRv84hgypbDINYTWmyEaz
         H7jrD4r5DD9ogXpT1fiZwkVYJ8F7RtZj1PLcccjR5xv/j3SHUXS0SDr9RhWl1gb5Fo70
         X9ysvtX3AK95zC31M9U+7HPcaZli2QNkT+GOdMRFZ2eamhVrpBQsBBdcHoxWEWVOcWOs
         58QMcKRqPVLhag3J9b08GEn99C3ATeXm41BgP00ctTFzcf1uj4qzmZR/ZninzJ41SIUg
         QkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722879; x=1794327679;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VyyXpKVbfO7QlnOVzcwHbjDy5NQCQYfozNetgEWlJ6k=;
        b=X8GggCkADQRwsCVwCdXlPcfv4YGd2pRSXcRU9KETunB6UOkATQTTnU2LTZAHWK3K2j
         5zagkmwLrGwdvw8pKd8VICk1v5w8FWzWDCY8TIcSg+htFY7YBCXPLwDcXWmdh3IIwlNt
         t6zsQv9JXw+0UjGg/NfUB53ZiefxcldOA/WD3Xgzhqv2SCo5eNbO3psCfEdf4nKTlaeK
         ECz1n7D0aS+OHEaeQcdXeOcKm63dsDLgIe8sP7vUDSneSqexZw+asqh/5NzbVk9Hm9eG
         v05NtWfMdiKIwryAQQ7kjgq8yNlJp6c4sU3m0bDpH1vc7pBETnRJWt2CFRBpd53+TLOA
         Rn7A==
X-Gm-Message-State: APuU4Z+sihqcbd9MYEYcCg1gqN2mpLWxzMKriEzGksD8tdHbkXifogMM
	YKFsMDzm5VG95CEEsSKAYM+bvZbKBAEfV27oE6qArh+IO6NA75yeV2Z5
X-Gm-Gg: AYBFou1XAbJAwSZeTlJHGfBWC40QUUs7AL64b1qJRWDqSR8GfTVdAvtmPLkO/oDtQ12
	1UQFNjNlVEL3TM75Lp9QUoKXp/esUutcdBHfwt3bV3pwaru7dvhYqFa1/6bPysfWaTAYcZkKXRZ
	OCFowYNl4l1u1kcSAYrCUAud4RGCgcguO1FpI7gKdcca3vK6Htu6GFn6Hq0W41kvKXwIdgJ6cwy
	WJtcBBH3hocma/xCwNcMy8u0ucL2f1/Kr1woi+Q93TOxwYGsZsaHTXTjqQ9pYaH5sqCbihXOYME
	QRvsWIjjs5Txra6lIxqxvQ5qCltyCVVBDaFvm2vIUtW93r1/C//YsdqFlmamtQdYiEZouhBnLo2
	AZZz9o9wXCO1InDbAhFxOHGMw0JR3w/vX+nGuHTCfUE9GcQ8sJlOtH2SXwAFnpjxGm1sASP2skY
	NmXU9C1kCFY5e01ZTgrCNEI6YiOJdlUH+qhZdLzHmi5xVSPHTjKCQapiV8kYe4m5fMPiGysLMZF
	unF/yqZ3JlYqn19MSzyHixAzjNroWISvQ5J0+RoyNAnstD1tLyX9LPmWanrGplev3xIOy9gBtWi
	cVh7T1R6oxQSJ856U5rz34uXgClTQH3eTiyiVYsbKnfBXw==
X-Received: by 2002:a05:600c:3b1a:b0:4a8:b8b4:6226 with SMTP id 5b1f17b1804b1-4ac18c73d17mr313580835e9.28.1793722878287;
        Tue, 03 Nov 2026 08:21:18 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa481a45sm63661075e9.7.2026.11.03.08.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:21:17 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Subject: [PATCH b4 0/3] review: recognize tracked patches merged upstream
Date: Tue, 03 Nov 2026 17:20:32 +0100
Message-Id: <20261103-detect-merged-v1-0-743a882c6127@gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANAJ6moC/y2NwQqDMBBEf0X23ICJQUt/pXhQM+oKte0mSkH89
 26rxzfMvNkoQhiRbtlGgpUjP2cFe8moG5t5gOGgTC53pbV5YQISumQekAHBXJ31TVH13pWBdPM
 S9Pz5++7UeqqPLC7tpKuf6GwJ3ouepaNa7/sXczFymYoAAAA=
X-Change-ID: 20261103-detect-merged-8214a37f426d
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793722874; l=1826;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=0/naCqviUYQuX5/IWeT18jR5WyiR9/CYSvNC2odLnjs=;
 b=/1M5iWr26kDdqGGjmptiHMUZIgzhBJvZ6bSzJ5aaxOyUkXLjHxd0FqVVLusaj9CF938T+swWh
 shYZQnyag8CBpQjmVsI/9uoncQuZlBqJJJmxh0PSxpwmMiRN52pLYQy
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Tracked submissions can remain in review after their patches have landed
upstream. This series checks upstream history during a review update and
shows which tracked submissions have been merged. Once all patches are
found, the tracking list marks the series as merged.

The check matches commit subjects and author email addresses rather than
diff contents, so it can recognize patches edited by a maintainer before
they were applied.

The first patch prepares the tracking database and branch rescans to
preserve per-patch matches. The second adds detection and displays the
results in the review TUI. The last patch allows the upstream repository
and branch to be configured, or the check to be disabled.

Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
Bernhard Kaindl (3):
      review: prepare tracking storage for upstream merge matches
      review: recognize tracked patches merged in upstream branch
      review: allow configuring the upstream merge check

 docs/config.rst                    |  31 +++
 docs/maintainer/review.rst         |  53 +++--
 src/b4/__init__.py                 |   4 +
 src/b4/review/_review.py           | 247 +++++++++++++++++++-
 src/b4/review/tracking.py          |  92 +++++++-
 src/b4/review_tui/_modals.py       |   6 +
 src/b4/review_tui/_tracking_app.py |  51 ++++-
 src/tests/test___init__.py         |  19 ++
 src/tests/test_review.py           | 232 +++++++++++++++++++
 src/tests/test_review_tracking.py  | 450 +++++++++++++++++++++++++++++++++++++
 src/tests/test_tui_tracking.py     |  58 +++++
 11 files changed, 1211 insertions(+), 32 deletions(-)
---
base-commit: 58b4547c6a402a83573b35f3b76d4bb71b51d2d6
change-id: 20261103-detect-merged-8214a37f426d

Best regards,
--  
Bernhard Kaindl <bernhardkaindl7@gmail.com>


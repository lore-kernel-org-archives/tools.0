Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864158;
	b=e+fM6STJC+z7gKoKHhHY2BeyWfFapQZLYrG/kLrVS+nHZRpBZ8Lb1nlnQnwrJ1/BVd+z
	 YsH/+7oefJi4NCu9oC+YEOcisAqqKd6PnO/aURYp5nbY4IA8w03E4U4ILzLtiugd+q1NC
	 1itNjBEPQRTbScT7nTRwLmQPBI5MbpIBMDs1JcptfEqYc9iwHbNwcL8GxXHlyMKmOC3tT
	 NnOilfXFGUq81Ca9010MJSL9d7keQD79gb9hi2JpkQno/khlh7YVjY3h4ex5EX0vHMDoN
	 9zXyKlTuDUZT3uOqxM15WnAaZaRP8YhQXH17HtMYsxkTFjSP0ObFZGuG/HvnGp50qgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864158;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GjgxchhIYrPm3JZ4Yfa9ihjvYbz8SVUwY9wu0WSOiPg=;
	b=N1rscweH8EKK/6R954DOpsWufTLTdSlDoZjDTNKuiIS2CIF+05Ai6lYLg4Ek0GSzR0jk
	 M5y7MFzVleS08qIiqpvPX6jFsN6QuR29y5szU9xvVsX2FHnLo5Cft25vL8CoWr6rDCgef
	 nZmSthOXN+SggVPS1I7LuYJ/VTqRO/4WwkIREBUTO4g0cPWpIrFV/FWWxBhsWeDA3fHj3
	 eUNKwU05dqT8hVEL7DMEa+6+TvfPQZJ2QcA+zgcrwkp+I50dncIxnEJ2CxDn5oyTNohef
	 BQFN4C5UDdRlhw80bP9aF/s8H251I+6b5Xm9bDV7eVdCxzCXrYt5aIS1omQCzG4RKNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFl4nyAh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168EC606A31C
	for <tools@linux.kernel.org>; Mon, 16 Nov 2026 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RFl4nyAh
Received: by smtp.kernel.org (Postfix)
	id B30CB1F000C5; Mon, 16 Nov 2026 21:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B061F000C4;
	Mon, 16 Nov 2026 21:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864157;
	bh=GjgxchhIYrPm3JZ4Yfa9ihjvYbz8SVUwY9wu0WSOiPg=;
	h=From:Subject:Date:To:Cc;
	b=RFl4nyAha1HeMbwKX3J+X/DRQgW9z7wqUvQ3CRqbNJK+Xt05m+Q+n9VZq6y8XngB3
	 4vg9zuu/kKv5hK13A4Qmhkleb4tpNBFkGmFDZomcCqN5PJg9aeGkykYyBT9uGhxeND
	 c1rNxs4pIz9JwKZyswLQFzgP2oZXCYBpb+l1TX7QnHgeq/E4daXAbG7y6NYnkLbEsN
	 tVXDtFk/hdOjI9ViDRH3XA6bH9euZnXv3qSqSZqk5uCWyuxsfPCq2D5/YMiemjQgKz
	 nyOjuHUQUt9n+4FfByZbDS/WKKZoz6vYfM+LFORsld2NZFXOkOTatxI6o6mccndPrV
	 TChP5MhPNKLJw==
From: Brian Masney <masneyb@kernel.org>
Subject: [PATCH b4 v2 0/2] review: add support for b4.send-me-too
Date: Mon, 16 Nov 2026 16:22:26 -0500
Message-Id: <20261116-review-send-me-too-v2-0-3e1e305e3272@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32Nyw6CMBAAf6XZM2u2S1Xk5H8YDkIXqI/WtIgaw
 r8b8O51MpmZIEl0kqBUE0QZXXLBQ6k4U9D0Z98JOgulAibeaU05LpK8MIm3eBccQkBqt6wPxLZ
 oDGQKHlFa916jJ6gNVD+WnvVFmmGpLVbv0hDiZz2PenX/TUaNhGQ5NyYvmOr98SrRy20TYgfVP
 M9f6K6zwcsAAAA=
X-Change-ID: 20261103-review-send-me-too-0f521902d8c4
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-de01b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=NkpvHdRfJif3Sxw82iWkHt4ShOMIr32zexfVbxKZ/tE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ+l4gVXhWN2Le7bIZ0fXF2uykDxzvm02w95o/2H/rd8
 ityo4lwRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNZt5mR4czah5UPLW3lzfmK
 1mSET0/YrzJxVRt3gP4VofxPrZ6fPzMybBX6UiC1+rMY78QdbE2xN+b11vbcNFke80JJ3dzqbKg
 pAwA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The contributor side of b4 already has support for the configuration
option b4.send-me-too to make sure to include your email address on any
outbound emails. Let's go ahead and extend this to also work with the
review and ty sides of b4.

Signed-off-by: Brian Masney <masneyb@kernel.org>
---
Changes in v2:
- Add send-me-too support to the ty code as well
- Link to v1: https://patch.msgid.link/20261103-review-send-me-too-v1-0-0d23443820b7@kernel.org

---
Brian Masney (2):
      review / ty: add support for b4.send-me-too
      add tests for b4.send-me-too

 docs/config.rst                    |  4 +++-
 docs/releases.rst                  |  3 ++-
 src/b4/__init__.py                 | 40 +++++++++++++++++++++++++++++++++++++
 src/b4/ez.py                       |  3 +--
 src/b4/review/_review.py           |  1 +
 src/b4/review_tui/_lite_app.py     |  1 +
 src/b4/review_tui/_modals.py       |  1 +
 src/b4/review_tui/_review_app.py   |  1 +
 src/b4/review_tui/_tracking_app.py |  2 +-
 src/b4/ty.py                       |  8 +++++++-
 src/tests/test___init__.py         | 37 ++++++++++++++++++++++++++++++++++
 src/tests/test_review.py           | 20 +++++++++++++++++++
 src/tests/test_ty.py               | 41 ++++++++++++++++++++++++++++++++++++++
 13 files changed, 156 insertions(+), 6 deletions(-)
---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261103-review-send-me-too-0f521902d8c4

Best regards,
--  
Brian Masney <masneyb@kernel.org>


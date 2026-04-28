Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5919F38A71E
	for <tools@linux.kernel.org>; Tue, 28 Apr 2026 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368569; cv=none; b=XLDUUcp9WOtfJTZNDQBOOPN4T5yXQo53AANvi23/dYsJBLBUWljUPuwQg2LZ38il8/zybPgxuxkQO+ez9XyBr5A7YUgBJyqrgql4OTsx3slCPDG2opBYRWin9lIF2C35swdyqZqbhbFJwHWpZ7ofD4n51M7molRIxFq621EZQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368569; c=relaxed/simple;
	bh=cvwXG+KA5rWLcypd8HjVHuuFPHU9HDwL60JnHxCJBJU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e1BBi440yN9X+5JKcWB1QgUkePEqq9Ny8qzayHx4X09NN+j3jdzjhghJ4E6CQEgOcg/8PNHZzqWTv0g7vg5vFxBSDAnzXpd7usp37SYMk6fCBSw3fk17URhedb8+hQWJkSEAkS6csdIvD4Pi7CbZwqIY1vJWT/+BUaIqjqKmKUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUPdqDv8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUPdqDv8"
Received: by smtp.kernel.org (Postfix)
	id 0CD8DC2BCB8; Tue, 28 Apr 2026 09:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650F6C2BCB5;
	Tue, 28 Apr 2026 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777368569;
	bh=cvwXG+KA5rWLcypd8HjVHuuFPHU9HDwL60JnHxCJBJU=;
	h=From:Subject:Date:To:Cc:From;
	b=MUPdqDv8didmdUhzCQUy+ys5T9x7VD9mpS2dW0hT5qNcWEBwtkKokm0NkUN/41QE4
	 ROF8WzOANzST1RDZYU8pSeJDMZjXox4k3NHROnV0jBpxOC/TvzpbpE/uK5gx6Pnab8
	 PYjYkgJsQXuqM2tZiQSsIJi3ywE0M1MUxhL27C4OgKMRBZHpNJnn8h2LcSJ1sjNiec
	 yUYENdcqLtgheRihFuYPKaKDg9zpSTjweoc6gMOZ4iMPfdTdrArVBu0gs3Y14uuo7F
	 NX/APRHGm3M6bcI8xUiNURJgP8ABkibFdaJzqAGcjjCo04bL5AApiq83yuMLS2W5Qk
	 xrN8Kt1VkcXGQ==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Subject: [PATCH b4 0/3] review: avoid downloading logs and fix URLs
Date: Tue, 28 Apr 2026 11:29:13 +0200
Message-Id: <20260428-sashiko-patchset-api-v1-0-24d4ac34b4ae@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMAwAf2Xk2cAMZRN/RXxos9RGYStNJ8LYv
 1vn4x3cbWBSVAyu3QZF3mq6zA3Opw44+fkhqFNjoJ6G3tEFzVvS14LZV04mFX1WpHEUZooxTA5
 amotE/RzbGwQH97+zNTyF6+8H+/4FYr3Ib3wAAAA=
X-Change-ID: 20260428-sashiko-patchset-api-277ecc2ffbd4
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=830; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=cvwXG+KA5rWLcypd8HjVHuuFPHU9HDwL60JnHxCJBJU=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGDI/1H4tCX52r6Ln8Utzc54t3grWM4+3JeZWzvt09GTi7
 zlTnQ0fdZSyMIhxMciKKbJIt0Xmz3xexVvi5WcBM4eVCWQIAxenAEzkizXDf/8gkT1TpoYfYtp3
 5EcW43tBmwMJl3TV22+en5T6z5TVS4aRYTtr6+4PB85uOdmzivvQ3h8/ptc7PNl/pjA2cW77jdK
 vjhwA
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

The build-in Sashiko and Patchwork support is nice!

Here are just some small fixes:

- Patch 1: avoid downloading the review logs that are not used.

- Patch 2: fix Sashiko URLs that were leading to a 404.

- Patch 3: use Patchwork target URL instead of the API one.

Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
Matthieu Baerts (NGI0) (3):
      review: sashiko: switch to patchset endpoint
      review: sashiko: fix URLs
      review: patchwork: use the target URL

 src/b4/review/checks.py         | 9 ++++++---
 src/tests/test_review_checks.py | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)
---
base-commit: d5d981426ead3f490713ef5d2fd1aa3d0f13b005
change-id: 20260428-sashiko-patchset-api-277ecc2ffbd4

Best regards,
--  
Matthieu Baerts (NGI0) <matttbe@kernel.org>


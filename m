Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E3F3AF677
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486676; cv=none; b=T4LnqveT/p9StVqRpN0L3jclo0VHGEg4SgzYZCV8tb0UhJ3fvAQQTv3L55D42xLB7fAji/Fg6TXL2Ockb0JdHiMx5asfYgQyeTthU3RcW+fPfRETkB0jp/n1Z6GNm9aOdWTkA0GNreKIU5mYJIi1DOOetgpOt24/bn4gI6HvUrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486676; c=relaxed/simple;
	bh=P6R1OfqHaf75YOjkBWRaIFhNV2vhqsQL+zYM9G3t2VM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TAGRk57moteUF7PPyoawBwkM+0gJltsId61o8ITe0pJxgSAQyk2MMMb9KnF6oqrkayVqy0bBN29R6BKxkvP05wGQ7nX6x7PsASCjmHvQltDS+Eu8dmHiQETbqXzAh/iyJoNDks4Ng1m4DjqzKNPberE5jI/o5cStEvasdLxQfxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TajdzigR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TajdzigR"
Received: by smtp.kernel.org (Postfix)
	id 34B2E1F00893; Tue, 15 Sep 2026 15:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B701F000FF;
	Tue, 15 Sep 2026 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789486675;
	bh=d9ysKwrraKqRgZCXceBRzrQOoBmFQ3my/fPiS5QG/eA=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=TajdzigR5ooPD6LsuPiCf2S8MEc1WeiyUySPV3oUcFRl4Ysl6qL7g2a38BBCSZG2/
	 EUW8RPqsjTJgCYZrZLr/qtgjaHqNur8h1zWyBfXyPGbsCfUdlhwXRBHsi6MP5gddBk
	 AChWATLJjVQ8jmDG6qd8VCfUHXPbXhnhudtnYVno=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Brigham Campbell <me@brighamcampbell.com>
In-Reply-To: <20260914-mbox-from-auto-to-cc-v1-1-fbf0c3fbd460@brighamcampbell.com>
References: <20260914-mbox-from-auto-to-cc-v1-1-fbf0c3fbd460@brighamcampbell.com>
Subject: Re: [PATCH b4] ez: include mbox "From " line in auto-to-cc input
Message-Id: <178948667154.2456.17535156414271846895.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:37:51 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=326;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=ws52kB1701oq8tuH6ZmXKjJBj6b79X6fIBlQngrn9O4=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJWpgUeYt+07I9ycZ3aKrvS4w/Ys2cE/zFj/J+xL5qL+
 +7R8ojWjlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABMR9mdkWH5kj+nvqVcZFbQl
 nvxJ+7fAdK9luPJcI46I545VBT5/djH8z+izPt2nz7j/MeOKpQ2Ts3obso9Mer7PpLYqIPTF8q/
 BHAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 14 Sep 2026 19:03:48 -0600, Brigham Campbell wrote:
> ez: include mbox "From " line in auto-to-cc input

Applied, thanks!

[1/1] ez: include mbox "From " line in auto-to-cc input
      commit: e13bf09973a022533333efc5f8ceff151d104616

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


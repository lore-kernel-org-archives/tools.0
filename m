Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FC34718DB
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508292; cv=none; b=hGMaD4EeqBcFa6M5fx023xyDtBmbfXufK2V584HDK0oM2giUdQB0B9wchvtXqAYnKxPwZIxbsSRX4FfVMygOzlZOY5kClEBJf9AxhTpR20kqy5a7c3WNwg48T8UlbpTAe6vkBID4qC29iEaGROd9oEkbePSD0RAEdzhcwfI20kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508292; c=relaxed/simple;
	bh=OO3H1Z7bldiSq2cBWm5V7I9210HHMvPuGwMTWdZoIUM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S0ci5etNwm2tNKAMBFDXXQciNae3GptlKi9HJ227QZeVbJCAXZkFPnOX5wP39iN1MHaHs14tPRpTkng9aD2JLIt0Pre6rgpmdhhJT/uFwZhYwIRqPFo3bjc8yn1107G7hm0OeclaELSdVO71JEsu3RQ/L6fL6wMlGU/OTDfiV1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=orjH3eWY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="orjH3eWY"
Received: by smtp.kernel.org (Postfix)
	id 4D1321F00893; Tue, 15 Sep 2026 21:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AB21F000FF;
	Tue, 15 Sep 2026 21:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789508291;
	bh=u1YX3TImyIe4koA2ctff1N56RArNIa1X3A8aLpiWAAQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=orjH3eWYyjxQLNAYJqIyWRDQ3WyHPz5UfeotF0Y4JTC89w7UTFUf3Vhy42rDT43Pa
	 nStmJpIlQ6sZRvhMdn4ErFUNMlXFYk6JMQhkWaanMK7nmMgLN7+pjphCiol4IipTCi
	 toiGTiyuuHl1Rvw7lXmi0pTFca0XEivnr37M4Uxo=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Vasileios Almpanis <vasilisalmpanis@gmail.com>
In-Reply-To: <20260902-followup-reply-signature-v1-0-394a5a4394cd@gmail.com>
References: <20260902-followup-reply-signature-v1-0-394a5a4394cd@gmail.com>
Subject: Re: [PATCH b4 0/2] review-tui: fix missing signature on sent
 replies
Message-Id: <178950828727.53447.9988015038459037289.b4-ty@b4>
Date: Tue, 15 Sep 2026 21:38:07 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=714;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=+9MH8BGRDGPtUz5CDSF5AqpXDey1eKdsfn9zQnBbsUM=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJW7jqoprb6sd63R5vfuj8X9pgXfnptdmDBKTchr+18G
 3yzxR9/7ihlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjARLgeG/2l3ij68XDTloX2m
 14vLayetubzIiNng5UuNsxG+1x2M1sxkZGi14FCZfSnY01h6571fWQt0H7M8TKly4LWQOF/hG+S
 jwQ0A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 02 Sep 2026 16:08:18 +0200, Vasileios Almpanis wrote:
> review-tui: fix missing signature on sent replies
> 
> The reply preview shown by "b4 review" includes an email signature that
> the message actually sent does not carry.
> 
> To reproduce: reply to any follow up message from the review TUI. The
> preview ends with a "-- " block, the delivered mail does not.
> 
> [...]

Applied, thanks!

[1/2] b4: factor the signature append into a helper
      commit: 18e65428929469fec2d70413b697c3785491353c
[2/2] review-tui: sign followup replies that get sent
      commit: eba2ad6356e99a32a4d0b9385925886d037e29dc

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


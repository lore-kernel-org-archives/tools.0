Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671881;
	b=w8FHoSYrLBvWe4dRgOAw0dB4phTe2Z24xMtADjLZxiQ6DxuNyzUbWtLJS2N1h+8b2QRR
	 WlcspulYRuq8OpkgJVmLQDi02wo55PTte+Wl0i9ofSjlLZ+JaKnAT+SmjUdGcIBJ7sj29
	 YauwKgVBOp6rzK/Bd9cwqoULHz/YhVA24ejWALIr56cYlAskcK9ciupFcFoqLtvFQbmj6
	 F4bov7k9veRM/XzmwxIFUy6AkWAjgFMrX7YGhx6XCndr3RVspG/KH4jJvwrVDoT14boYI
	 1av73VKHq5KxjwcC+ksuLAPkvVxsPtNtXKwyh39iCL8AY4dBX53iHSSkM3VnzufypLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671881;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7oIMfV5Hebk9XIHUVDBUWokitFqiOyRSMJdhflGIp7Q=;
	b=TgH5bO3mtBqOB/HZx5c+4VY2+JLw5htRGrCZhbg/Bcww5d18P6ceH67a570/vO19dBDq
	 9+Y8n0d3oB2OKJT+fzy8mIy4RSr2K3HrpcRMbPloxX7/ysoMZutUQwAcrm6tDklL6U4L4
	 YKK2kuMnX0Dh8phpnW+9T+qegJaU3jYOOyLG1MSpzGPHZKEj03HQr6hGpXi0UsDMD4NX8
	 me/EwzzxVqx+dgGN2lPrGUDfhlyMUx5bY9tNxqE4uJFBjH3XgZdueG4ABe0buYFH1O318
	 YJJrY64C44bvlij877WzYxUJUbiibPojWR0rQneOityEnIaVbUwOtnjqj7sLuMZUB+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qCZ1f0EF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28314606A31E
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 05:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qCZ1f0EF
Received: by smtp.kernel.org (Postfix)
	id BF3C11F000C0; Thu, 26 Nov 2026 05:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0511F000C4;
	Thu, 26 Nov 2026 05:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795671880;
	bh=7oIMfV5Hebk9XIHUVDBUWokitFqiOyRSMJdhflGIp7Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=qCZ1f0EFYf42nkcMrw1DE0ZbbOlMBSF0z1jsSzG4iarIHhex4KHEl0Z05F8UdGk8K
	 0ViurtxGZDXc1Inkr5nWhC7Q1vcqviaSf+/oVoUUzK3rjrILZPk+gkhmg8mLxijK6P
	 7npWchFMsPef+NDMZmbkIgS3w3Y73ca7uTHSjVsM=
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
Subject: Re: [PATCH b4 0/5] send: resume interrupted SMTP submissions
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Gabriel Goller <g.goller@proxmox.com>
In-Reply-To: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
References: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
Date: Thu, 26 Nov 2026 05:44:37 +0000
Message-Id: <179567187791.1145923.12583977755339765229.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=LEthx+Z1uNjOwJijsXTTUHJmYqwMYAXLIfB6AsJfYP0=;
 b=kA0DAAoWtsQc41ZkmWwByyZiAGsHx0ahLwXCfruQGxupkbcZzVFiQ9RP/oC2jLp0RPN0X5Ojx
 Yh1BAAWCgAdFiEEdr5dslJx4UgeZ4w1tsQc41ZkmWwFAmsHx0YACgkQtsQc41ZkmWzWqQD/aZWM
 9ZkXWo88oZwHSSrRFFO2Dqsui7BZy6LLmBwT7vgA/iEbtBn2WfooW883c3xWFWRHvszegL5JoNi
 kJW7XXmAO
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> SMTP failures partway through a series leave some messages delivered and
> others pending. Retrying the submission needs to preserve the original
> thread and avoid repeating messages or recipients that were already
> accepted.
> 
> Save the signed messages and envelope before delivery, record acceptance
> per recipient, and add b4 send --resume to continue the saved submission.
> Explicit rejections can be retried immediately from an interactive prompt.
> Uncertain outcomes require reconciliation before another attempt.
> 
> Delivery uses the saved submission independently of current branch or
> sender defaults. Sent-tag and revision bookkeeping happens afterward and
> can be recovered separately without repeating delivery. A changed branch
> is left untouched until its original state is restored for bookkeeping.
> 
> The message-preparation and bookkeeping changes overlap the pending BCC
> series [0] and detached-HEAD RFC [1], respectively.

I've adapted it to work with the bcc-send series, but I'm still sitting
on the detached-head one, because it makes significant changes that I
want to properly consider.

This series has been merged with some changes.

Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

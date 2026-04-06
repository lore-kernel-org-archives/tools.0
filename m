Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36513009F6
	for <tools@linux.kernel.org>; Mon,  6 Apr 2026 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775509612; cv=none; b=hjSyAEfIcYXuYwLeTdWhWil707UScYE4x510tMOqnyYg0JCjcN/gvlyMe2mexXqS2pRFRxyDrcI0JOduO2je3WZ8PdjlWj/MbrZ4Xhi9hPbRYiE9J2WsoHk2ObcGfXjGJY07cxenseBthgKGd9+bDRnXJ1VGeurV6rrWCONFrr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775509612; c=relaxed/simple;
	bh=ytnGzrLImLMHOnoND3EisIQSY2wkOWaVYCWFF7bnFvA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Q9ewF2aWOtYglwQn9mjlWyYn77Rpg2fBP/QUAYkct26U+XnG2oDgMZRF011QRibEIQ3xfT7XXKwxMvGOtiO108soXK8AQvtxs+htv2B96FeT+iTN0oF7mUDgJmnu0IL59U9pIiu7otiyB9C1xKHsuvKGk6QNTttJiWK4+gNPuEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ud1YryhT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ud1YryhT"
Received: by smtp.kernel.org (Postfix)
	id BA954C2BC9E; Mon,  6 Apr 2026 21:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F4DC4CEF7;
	Mon,  6 Apr 2026 21:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775509611;
	bh=ytnGzrLImLMHOnoND3EisIQSY2wkOWaVYCWFF7bnFvA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Ud1YryhTXUZL8ZilLnIDdrSDFF80tXtLPoa863TFI/j0w0iJsKZMpis2V5CXIzGsC
	 4H2Td9F7aXHvt2ng4ATqfiGqCs7JCB83saQs3xcWy3cFmzTBeOQopVYlsgG2dbb0bL
	 43/1j1ttjbNtUYXAkFwMzsgAualCR3bJAzRgwtYc=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: b4 review state is broken after series reorders patches?
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Kernel.org Tools" <tools@kernel.org>
In-Reply-To: <CAJ-ks9=De02zhrrrbqEO3wUCzBazsiDV8vgpKNKD7=mVUBomCQ@mail.gmail.com>
References: <CAJ-ks9=De02zhrrrbqEO3wUCzBazsiDV8vgpKNKD7=mVUBomCQ@mail.gmail.com>
Date: Mon, 06 Apr 2026 17:06:47 -0400
Message-Id: <177550960799.3495947.3585844597234766408.b4-reply@b4>
X-Mailer: b4 0.16-dev-9febb
X-Developer-Signature: v=1; a=openpgp-sha256; l=490;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=ytnGzrLImLMHOnoND3EisIQSY2wkOWaVYCWFF7bnFvA=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDKvKGQlHvVvbTxWLD7lUtLsKQs0H9pOTbJrfLrSacaHP
 UFxZk6lHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACbyagUjw8VF7jucuK7fX3V7
 smTw1Cd89wytGBLzd1zecucS87TjDJmMDG/yNfR+8vEyXPqf63vhn+dWV9ObbR0ixzfdONJ/P0w
 +jw0A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Mon, 06 Apr 2026 10:23:17 -0400, Tamir Duberstein wrote:
> I reviewed v1 of
> https://lore.kernel.org/all/20260405235309.418950-1-ojeda@kernel.org/,
> but I was then unable to review v2; range diff failed with `Could not
> find series v2 in retrieved messages`.

There's now a fix in master for this as well. It's also backported to 
stable-0.15.y -- hopefully that improves the experience next time you 
upgrade local branches.

Thanks for your reports!

Regards,
-- 
KR


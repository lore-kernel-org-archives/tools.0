Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EE93E0254
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243683; cv=none; b=BiWmth45//lmsCHVQXi5stOfy+KAG5h76uLW8QKKnGv/zc7bV/Uw0eUw2RPfrpbaqQSx8BYv7lAzvIMTh1EIKLn/KqpJlwJ0j/YEQTqTXknlzzvULnOx4jD5jxNzOWeWxbqdvs0YCDtdp8th53yOINTK9n7rV++ekJHC52r/qxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243683; c=relaxed/simple;
	bh=Ec5lyObeQqOHmG97iUvebZJ2yATBWOBe73eM/zciOYg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=j2PAavteL8pKMidxeG+/AL48055QRIdAarBxje3ZFncpPVre2+j7BSNMTADVgfPd8OWgWCNaeYrSNL9LyDWsrxIwpMxITzEvtk61/hlbTtVpF06xTcyp/gMjPGamwjw0pv7Irigf15fNBQs1PTEdNn2ahaBGcZCqNt+QbsW4U/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iBzOV3Nv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iBzOV3Nv"
Received: by smtp.kernel.org (Postfix)
	id 739B6C2BCB0; Wed, 11 Mar 2026 15:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD27C19421;
	Wed, 11 Mar 2026 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773243683;
	bh=Ec5lyObeQqOHmG97iUvebZJ2yATBWOBe73eM/zciOYg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=iBzOV3NvnQgyNuJfPW4L4JyyRZm9g5wbSUEjG7Bs7kec70O9hp+ImqBt8WTda61E9
	 x0qI6KZIC90+zApAm+3y0czTRE4gnZJ/RbX+EBBWD2wPRBvnvUYbXSvlL6V9neDtEj
	 tAFfGf9lmVJWyzCakEyWDPlvA8SakIhSjrATV0Ek=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] b4: allow using xoauth2/bearer token to authenticate
 to SMTP servers
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
In-Reply-To: <dd4ed10a-2648-4ac5-9df7-6c453114a820@vaisala.com>
References: <20260306162020.54683-1-dtor@chromium.org>
 <177281752583.2015423.2312633416921696209@lemur>
 <aasPUY9XWOBy96rx@google.com>
 <56dc34c8-c63e-47c8-9ea7-4420d71574f2@vaisala.com>
 <aa54CjijJk_1S4dd@google.com>
 <466569ed-7b4e-4ab8-a6be-3c5379fc3544@vaisala.com>
 <aa77-EczsZt2eRln@google.com>
 <dd4ed10a-2648-4ac5-9df7-6c453114a820@vaisala.com>
Date: Wed, 11 Mar 2026 11:41:21 -0400
Message-Id: <177324368151.718772.803805188156299759@lemur>
X-Mailer: b4 0.15-dev-cba5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=458;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Ec5lyObeQqOHmG97iUvebZJ2yATBWOBe73eM/zciOYg=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDI39ipxzd7oOrlPvHbfeotZBvsLZVZdu96ePZvVfNXhD
 WelZSWrOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzEKZPhf3xOqUBXW8hXpxCH
 QxFlIhye5zyeypVej3zzNSU3wu7zSYb/fnti5RqFlh96y3Vm/9zWmddyLdfuSt4l8Oe4neOCSbF
 7+QE=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On 2026-03-10 08:48 +0200, Tomas Melin wrote:
> > The beauty of credential helpers is that if they do not know how to
> > handle the request they simply skip it so that the next one might be
> > able to resolve it.
> 
> Yes, indeed then this looks like a cleaner solution to the 
> authentication process and the approach proposed in your patch should 
> be taken instead of my initial attempt.

OK, I will take Dmitry's patch, then. Thanks!

-K


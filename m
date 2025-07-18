Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AA429ACC8
	for <tools@linux.kernel.org>; Fri, 18 Jul 2025 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752854735; cv=none; b=BGNbS5pzM9P83DIIn7c9k98TNWhRfsMiMWfptGCd015YQLQkwhmJMyTKAnG8B5MW6NPFpTN4s0G9FI6Jedam/wpWovl/Te/DKF9Bti1E5V0n18OZywjqKRv5nH5/d3aWJbse+QvfarPmIBBEVZ25Iw/KKrx2QR+u9jaqPTxFN30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752854735; c=relaxed/simple;
	bh=c/ZuwKASLQfdMnQTyoJAndwWPP457ds7irIPIKMB/7U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PQoFG7OgDP9XLG8U/BrDU6muVAv8z2+VW2rCjcysAmVCNixZ83UmwRLuKQI8Ft3D0eZDAiG7YPAGLwLD9Wvg0eyhj2ZDsI66YqnWtkxECdE9X3POAtuN219MC1/8/kHTFSMRT4vToP4ArsfnbtFYi/tCsyAp9M/wpRRsbu4m6TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IBAOt40d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IBAOt40d"
Received: by smtp.kernel.org (Postfix)
	id D3EAAC4CEF5; Fri, 18 Jul 2025 16:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC96C4CEEB;
	Fri, 18 Jul 2025 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752854734;
	bh=c/ZuwKASLQfdMnQTyoJAndwWPP457ds7irIPIKMB/7U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IBAOt40dqOOreOXesv6oQmP6hrtM0Y1g0/LaleVJ3+EkFoIaM+3oODGmJk9h1yr0C
	 xIKTKus62iZvhowH0WLVVIiIkv5VMjA14e7E1ZJZoU5FdbqP5C2bKzMd7/LXUEF1xL
	 e413S8zFUTJXCq1heYJIegcthdvdGJpA2Qp7vq4k=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Jonas Rebmann <jre@pengutronix.de>
Cc: kernel@pengutronix.de
In-Reply-To: <20250718-fromaddr-v1-1-8bc274dce855@pengutronix.de>
References: <20250718-fromaddr-v1-1-8bc274dce855@pengutronix.de>
Subject: Re: [PATCH b4] Fix broken fallback to user.email
Message-Id: <175285473437.443805.4943980024509812567.b4-ty@linuxfoundation.org>
Date: Fri, 18 Jul 2025 12:05:34 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-8018a


On Fri, 18 Jul 2025 14:04:04 +0200, Jonas Rebmann wrote:
> After conversion to string, fromaddr becomes "None" as a string literal,
> so the user.email fallback would never be reached if sendemail.from is
> unset, eventually leading to `smtplib.SMTPSenderRefused` (<None>: sender
> address must contain a domain').
> 
> Convert to string after the check.
> 
> [...]

Applied, thanks!

[1/1] Fix broken fallback to user.email
      commit: 5c822eded2b6f9df67f3e860a8a0017b440471da

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB4030EF74
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 19:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771962114; cv=none; b=Jz60O5aDEwV8RXNP3TdDFwx5FuLcxIHpiEcyFucNdWFCG3UO8PGPXcE4MAjZdAuWak6uFTV/NOHi4NrG0qd2DnVutjyurw4ee+8bUty8g5q37UWGi7rDECk5i2h5V0GwzSO4pQRq0txwni1X8KYusTLQ5orPPaYwKsUYgMPz3K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771962114; c=relaxed/simple;
	bh=iRIVMd1aXGKo1RdDG4lK4p25jnCcyWc3gr023A7VOsM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=BdAWWONCiYfv6qGRNPB88OjGXb6+OPrw17jr9O34Awy0N5MYRUyY1q7HGTV/d1ldSoBz1sWYox17U7EUGJx/DlYkpCNeaW+1UylBEULka3LMAqJBQDMY0PXmXoSUJrIDO23C+HwWpZkstQhEaCBC8HbDWVUNDeNKYHKi3v/DXUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R9L/DAlb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R9L/DAlb"
Received: by smtp.kernel.org (Postfix)
	id 97DB3C19423; Tue, 24 Feb 2026 19:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D69C116D0;
	Tue, 24 Feb 2026 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771962113;
	bh=iRIVMd1aXGKo1RdDG4lK4p25jnCcyWc3gr023A7VOsM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=R9L/DAlbrsPrfkua2kdb8r/BV9YLT17ExB6gEES/hk0kkF16zBtMiKGzIYs6ViNNf
	 BrRC2Sv2sLNFb3Pr6W0Tlj8bgCg1LQrGwDdlTLETonXxWQKWZn6hOfz90cOWA61hhK
	 diKfmKLHx5xS083uWZeEsQx38UNmf7sxyNKLFvrU=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 v2 0/2] Add support for xoauth2 SMTP authentication
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20260205-smtp-oauth2-outlook-v2-0-6a5eb233b285@vaisala.com>
References: <20260205-smtp-oauth2-outlook-v2-0-6a5eb233b285@vaisala.com>
Date: Tue, 24 Feb 2026 14:41:49 -0500
Message-Id: <177196210934.4027376.6485173357066354678@lemur>
X-Mailer: b4 0.15-dev-2caa3

On Thu, 05 Feb 2026 11:26:00 +0200, Tomas Melin <tomas.melin@vaisala.com> wrote:
> Add support for xoauth2 authentication with SMTP server, integrating
> with git credential helpers for retrieving tokens. With this approach,
> the same configuration as is needed for git send-email can be used
> to send patches using oauth2 with b4.

Thank you for v2. I have a few more requests that I will send in as 
follow-ups to individual patches.

Thanks!

-- 
KR


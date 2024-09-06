Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2221D1F50
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634035; cv=none; b=f6qZYAqxsghmPUM/6/MecXl26mLLE7339AjPQWZTbmmmxa4IDS194vKWBzUdzpKeKZExCZZPBNHEbtiFoniI0/ub8eYgHpwYBB/7PCyApEAzerrijoVWJCT+5tyxtqUO3+75nOFkvn4syFrha2hDLFvo70DRtm8KYayZfCmLbTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634035; c=relaxed/simple;
	bh=4hO7WEXK5Vct6wP46U8N4w1SvE2cBSHqYY5ZFpjM+Kw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fZ9OTUJDaV1QPwZqWu8y/dtIJSDBLJQTqUAQinsJTsMuWRzQxgQhYxBGOuXbQGD+L7Nq9kYP89S98qbzIWMFV9V9kOKAymGQOxlTsY/AYSwX3F9thBDkRPamdTaVkniScTPbnvDci6EQrn1/t4xE4sz8HoPxkTxyPUtowGSfBK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2S01lblf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2S01lblf"
Received: by smtp.kernel.org (Postfix)
	id 6DEE9C4CEC9; Fri,  6 Sep 2024 14:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC3BC4CEC4;
	Fri,  6 Sep 2024 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725634035;
	bh=4hO7WEXK5Vct6wP46U8N4w1SvE2cBSHqYY5ZFpjM+Kw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=2S01lblfM71ZVbURfF0IKA9NX0FftmIFFo8/AfEdv8PgbWSDkuz/mG7ZwhoG0Puxe
	 khDUFbj0kCUpZ77fNltQf02PHDE7Bj4EsIqSXlVlHPcSHYUKkOTv7UQ4QFt+Ffq0P6
	 ZOdZRCXyLSdQvMNoqwaBplWzYAN1Hsi5NybxwHfs=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Brandon Maier <brandon.maier@collins.com>
In-Reply-To: <20240626-report-check-cmd-stderr-v1-1-50d97e394371@collins.com>
References: <20240626-report-check-cmd-stderr-v1-1-50d97e394371@collins.com>
Subject: Re: [PATCH b4] Report ecode and stderr from check commands
Message-Id: <172563403508.23316.14181224056611444511.b4-ty@linuxfoundation.org>
Date: Fri, 06 Sep 2024 10:47:15 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-40f6e


On Wed, 26 Jun 2024 20:37:50 +0000, Brandon Maier wrote:
> The ecode and stderr from check commands gets silently ignored. This
> means if the check failed for some unrelated reason, it will appear as a
> success to the patch author.
> 
> Treat all output from stderr as failure lines, as it's expected normal
> findings would go to stdout.
> 
> [...]

Applied, thanks!

[1/1] Report ecode and stderr from check commands
      commit: 94adae1b647c048832cb28fc82e71cc21f7433e2

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


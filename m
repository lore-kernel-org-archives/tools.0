Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7CC3FC5B2
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106970; cv=none; b=MFbxsYRPqzBAnN2/qE/aq/FqSYjoMD8eiYUg6L74lFT3ssNCfdWUunOCHzQCKD5K6xJxs+w4GVPPB+9ayqEKniLEc+iRc/xODKwR1sVIrzl/56YbfJSyX7iZS7ZUHys9t427EE8ho5NwvlfEUaUNS3FObQd28W8/TlQkGHnxZl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106970; c=relaxed/simple;
	bh=/2NvMJ/oBlbIrlif7086aztNgcNy/ir6/CI7RmgKrjY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kbDe7kLo5ytPeEguitrtcu5zDYfB1Q8DlVdoVkDNoeHXeQtYIpTc8BVZZGSdptvG19K/VTJGY3rvzUgX/SHWUvtb8DC7Bu04oLtPlNBN2ruTaeqCuXxlRfHhSJLVN7gJiXniMNLd6CRQMaJOiDj8OLuTYzf9gXYhuGPC68gwARk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vFf4Kc7g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vFf4Kc7g"
Received: by smtp.kernel.org (Postfix)
	id 4D2E11F00898; Wed, 10 Jun 2026 15:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06C91F00893;
	Wed, 10 Jun 2026 15:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781106969;
	bh=dAFXbzA5Qxm5Ht3ihDFznNPil5fp10ksrEPxS4FZ5z0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=vFf4Kc7ghUwDASeKdV498y/BZkGmHAYAvbjgsu/0GkGGUV5EJHpORD2k1G+2NU1+6
	 0RV1XKaogSC9hpZYiyLW7MYzMSyZHKVcsqh5Piz7ebRZ1i7uTE0eYc/PvZ+JmATVrr
	 i/cxPeXZk2gI76LXv7LAy7fd0AfduXEOnsQviAOY=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: b4 review can't use merge strategy when skipping patches
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org
In-Reply-To: <aiijcYQInbjJ3kT4@sirena.co.uk>
References: <aiijcYQInbjJ3kT4@sirena.co.uk>
Date: Wed, 10 Jun 2026 15:56:04 +0000
Message-Id: <178110696427.220060.12567432631798909648.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=756;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=/2NvMJ/oBlbIrlif7086aztNgcNy/ir6/CI7RmgKrjY=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI0OyWK3OalhuXxJ7Gc49L9rhZxwNbJbfvH2xN2vzj6+
 rd8SWJVRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgIkUyjAyrLnnf+lO8w3WCa8V
 2G8/vOH0te+Kzi6PDdFK8yddfh12MZuRYZZV5c8PjkIiB+V1w11XrFsfUvPlQGpefUdS2nl50Tv
 rOQA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Wed, 10 Jun 2026 00:36:17 +0100, Mark Brown wrote:
> Hi,
> 
> It's kind of annoying that b4 review can't use the merge strategy when
> applying a series that has skipped patches in it, it means there's no
> way to include a cover letter even if that cover letter is very good.
> Skipping is very common with multi-subsystem serieses, especially when
> DTS updates for some SoC or board are included along with a new driver.

The latest master should allow you to do this. Please let me know if the 
workflow works for you -- we pop up the patch selection screen as an 
additional check, but any patches you've skipped during review should 
already be deselected in it.

Thanks,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


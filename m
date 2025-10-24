Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D9C242D67
	for <tools@linux.kernel.org>; Fri, 24 Oct 2025 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761330174; cv=none; b=hK/lLBqlCXgQSJbbQLVQNi0dtUHfrykZxCtZwGnxEY/yV9PgY2eeP6sskGxPs1DBKo1TBnDLOvRsiRdAuSQsEafCch7mFx8VC3Xjt9c4o463a7anRTCN8TpiH9ayB8TGhLzixDrj3BH5ViIV2P1vGdY9uzJRS7c6jEMEF8IZB5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761330174; c=relaxed/simple;
	bh=N7MwdwtBMQ6gISBvDipuAP0HbmzddgwtFFHE6i1hXUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIbVc/cfUiMv+NIf+vRM5RVnA7ayXLEgONHi6cdlUv5u+I66Y8aD9Fq4cEQmeCX73DpioWrdOtz3BneZ1nHnNoFtynk9FKH7S2yyFg9Fggkk0GzkmCd531xxKsN6Qo4dpQ0+KfBYOZtFqS1RET7vpgnEKl/HHqg7AuOK/IfFeI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bnbviSzk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bnbviSzk"
Received: by smtp.kernel.org (Postfix)
	id 8CC90C4CEFB; Fri, 24 Oct 2025 18:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58197C4CEF1;
	Fri, 24 Oct 2025 18:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761330173;
	bh=N7MwdwtBMQ6gISBvDipuAP0HbmzddgwtFFHE6i1hXUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnbviSzkroI8iz7tZSHa702llPATnaFv7pPAfiEU9uNbYF2TVn7mHwyFVtE198YM4
	 BtGfXI10i9SChqACDOqG5HPdceZLDyNHCW4RXV1ytOqM8r42l/vor83foWt/4kH36M
	 A5zRLc4N/iJWTnD3xEem3ZApB3P30XkEWbhhTbII=
Date: Fri, 24 Oct 2025 14:22:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] b4: allow multiple b4.email-exclude config entries
Message-ID: <20251024-convivial-strange-moose-cdacdd@lemur>
References: <20251022-jk-multiple-email-exclude-entries-v1-1-79f4b936f612@intel.com>
 <20251023-merciful-angelic-squid-0a97ff@lemur>
 <6ebd7f92-7ebc-479d-aeec-d4ac008dd21e@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ebd7f92-7ebc-479d-aeec-d4ac008dd21e@intel.com>

On Thu, Oct 23, 2025 at 03:04:15PM -0700, Jacob Keller wrote:
> I do have two points that might make it not worth changing:
> 
> 1) currently if you have multiple configs, the most specific config file
> will take precedence. If we change that, some user configs could break,
> meaning we have to make it a breaking change..
> 
> 2) I don't know if there is a way to override and reset the list. I
> thought git config might accept an empty value "email-exclude =" as
> resetting the list.. but it doesn't actually seem to work in testing.
> 
> Given that my main concern was being able to keep the lines split which
> does work in my testing, I think I'm ok dropping this patch.

I think I'm going to let this as-is for now. I can see both possibilities
being valuable (setting something more globally that would add on to any local
configurations), but I also find it useful being able to completely override a
global setting in the more local .git/config.

Seeing as it's already in place as non-multivalue, I'm going to let it be
as-is for now, unless there is more interest in the future to change it.

Thank you!

-K

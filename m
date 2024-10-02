Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717E1D1E67
	for <tools@linux.kernel.org>; Wed,  2 Oct 2024 14:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878479; cv=none; b=hW+AlUFL1DWPIG9y8+Oc4E1Srrc4fObRjQ3iVMj2ml3x47VdO2zSMLpVenorF9t2cbC/ZLoyC52o6hPNmBfUGa8pu/0T/t6KObQtvq2BwJkd2Yud3P4jzFTTf4VEK4B+gqaE/QfZCRtOkN1RcYoiZg0y4F8MzkRwshdOSDc2YMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878479; c=relaxed/simple;
	bh=LAnpJ2bambxZwQmmsUDMys96KEnzboyAGsG9lUJYpbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNoiAO824erlL641usz0UvLI/zGxrambiO/+fRlxXSmL0CVsFAHyjrLfiC1twXEoXVMadOcpHATSDOtpEljW4bsommebqI32UD+VIkq3piQcPnIq+/yc76feymnoym4DlrPJ28sJvSYxKsc4mbTji2uwUg6FFYvDCI2iJW5STRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i44PgPnO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i44PgPnO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E711C4CEC2;
	Wed,  2 Oct 2024 14:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727878479;
	bh=LAnpJ2bambxZwQmmsUDMys96KEnzboyAGsG9lUJYpbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i44PgPnOS+NEfUYJDB6FwIPyY0SaWjozuhj9Kk9FWNzQfooqIyM4WGw0h+xyWLI7B
	 9QeTAUaxaz1R24LL/kTLBJZMGPHO4gNYG/sFEifw0tmhD3DyNp0BJzV3U3Boe4rxZr
	 QDFZYU21+VSHkkDbUdSP4XxFuZfhYwGxHN10Ms7E=
Date: Wed, 2 Oct 2024 10:14:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 trailers --update picks up bogus trailers
Message-ID: <20241002-sophisticated-fox-of-protection-c8051e@lemur>
References: <98450a13-1339-41e1-87b4-3db7387906c7@sirena.org.uk>
 <20241002-quantum-guan-of-action-427cc4@lemur>
 <e574a54b-c091-4b7b-a182-d285f54f2e46@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e574a54b-c091-4b7b-a182-d285f54f2e46@sirena.org.uk>

On Wed, Oct 02, 2024 at 02:52:02PM GMT, Mark Brown wrote:
> > 	Finding code-review trailers for 41 commits...
> > 	Checking change-id "20230303-arm64-gcs-e311ab0d8729"
> > 	Grabbing search results from lore.kernel.org
> > 	---
> > 	  + Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
> > 		https://lore.kernel.org/all/878r3f99o1.fsf@linaro.org
> > 	  + Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> > 		https://lore.kernel.org/all/ZvyCC7tJT7QoKO%2BD@debug.ba.rivosinc.com
> > 	  + Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
> > 		https://lore.kernel.org/all/ZtbQPBSl6Ym7g4QE@arm.com
> > 	  + Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > 		https://lore.kernel.org/all/ZschddrfehjVUMXw@arm.com
> 
> > Are these different from what you see?
> 
> That's what I see.  The biggest immediate problem is that the R-b from
> Thiago was sent against v8 and then gets added to patch 2:
> 
>   mm: Define VM_HIGH_ARCH_6
>     + Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org> (✗ DKIM/linaro.org)
> 
> which was not present in that version so the tagging is clearly
> inappropriate.

Yes, you're right -- there's a logic bug that causes trailers sent to previous
revision cover letters to be applied to all patches in the newer revisions.
I'll work on a fix so it respects patch-id's.

bugspray tag me

-K

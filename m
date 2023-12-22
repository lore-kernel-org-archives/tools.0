Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECFE2E620
	for <tools@linux.kernel.org>; Fri, 22 Dec 2023 18:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w/E2IBM1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34E7C433C7;
	Fri, 22 Dec 2023 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1703270584;
	bh=B1PCkmOJmkDfdtxl8PfDeZqT9DiSydzi0JcV/8qxYNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w/E2IBM1XBjrmg/0WlVoZu5n5qhwOgZoN/I8umAwKjBexX6HMOYkEmYPlp+DtWpib
	 M4gfH1eocGq8hhWCiQ2WLO8HE24MYtHFGXBnsWflO1v7DsdjO31iBlqCHN53lwWzVj
	 FYSAco2lg+hB/YR5HNGe/U7wb6uYJ134fMWGOoGs=
Date: Fri, 22 Dec 2023 13:43:02 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Use the Low Power Island CX/MX
 for SLPI
Message-ID: <20231222-smooth-jellyfish-of-vigor-1acab8@lemur>
References: <20231220-topic-sdm845_slpi_lcxmx-v1-1-db7c72ef99ae@linaro.org>
 <9dc9b23b-6ebb-45b2-a03e-1379a4ceab90@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9dc9b23b-6ebb-45b2-a03e-1379a4ceab90@linaro.org>

On Wed, Dec 20, 2023 at 03:16:00PM +0100, Konrad Dybcio wrote:
> On 20.12.2023 15:15, Konrad Dybcio wrote:
> > The SLPI is powered by the Low Power Island power rails. Fix the incorrect
> > assignment.
> > 
> > Fixes: 74588aada59a ("arm64: dts: qcom: sdm845: add SLPI remoteproc")
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> b4 seems to not have included my "only compile-tested" comment

Can you let me know your expected behaviour vs. what you ended up seeing? 

-K

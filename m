Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B133C9;
	Mon, 31 Oct 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1667236261;
	bh=mU+9AZmUz9zDgjwtASID6aDN2sdOe/ZBfJlf1lULGWQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=fzG0i17ghDJ1hwfmP48R1Vh4CPmxEh49s7t7bI5lzd/OtbsbpumVJh/jGnr/OEgjO
	 feSBizbLVPGlwi9T8nTYrN3e4vWay2Ai5gMLd9ufRbXnuJFLxVWrowMt+71DJm5mrt
	 EWm7QsSMHf56LpMRcOCZiYkX2GBRHHZWHMAlXKRc=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 67DEA1280E59;
	Mon, 31 Oct 2022 13:11:01 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlwyhEqMgwer; Mon, 31 Oct 2022 13:11:01 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1667236261;
	bh=mU+9AZmUz9zDgjwtASID6aDN2sdOe/ZBfJlf1lULGWQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=fzG0i17ghDJ1hwfmP48R1Vh4CPmxEh49s7t7bI5lzd/OtbsbpumVJh/jGnr/OEgjO
	 feSBizbLVPGlwi9T8nTYrN3e4vWay2Ai5gMLd9ufRbXnuJFLxVWrowMt+71DJm5mrt
	 EWm7QsSMHf56LpMRcOCZiYkX2GBRHHZWHMAlXKRc=
Received: from [172.20.4.92] (unknown [160.72.53.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 7AB1C1280685;
	Mon, 31 Oct 2022 13:11:00 -0400 (EDT)
Message-ID: <7b25ea15b6e508f435ca36967d9f4d4408f9a690.camel@HansenPartnership.com>
Subject: Re: DCO chain of custody revisited (was Re: [PATCH v4 08/11] mfd:
 qcom-pm8xxx: drop unused PM8018 compatible)
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Neil Armstrong
	 <neil.armstrong@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>, tools@linux.kernel.org, 
	users@linux.kernel.org
Date: Mon, 31 Oct 2022 13:10:58 -0400
In-Reply-To: <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
	 <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
	 <Y1/qnCyav/S35mRo@google.com>
	 <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>
	 <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2022-10-31 at 12:58 -0400, Konstantin Ryabitsev wrote:
[...]
> I assume that in the final commit Lee rearranged the tags in the
> following order:
> 
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Lee Jones <lee@kernel.org>
> 
> This would indicate that it's *Lee* who is claiming responsibility
> for collecting the Reviewed-by tag from Krzysztof, because it is in
> his chain of custody. However, this is not the case -- it was Neil
> who collected the tag, and therefore the "more correct" order should
> be:
> 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Lee Jones <lee@kernel.org>
> 
> If my reasoning is incorrect, then I need to go back to the drawing
> board.

You're way over thinking this.  The only tag that matters from the DCO
point of view is Signed-off-by.  That's the ordering we care about for
the chain of custody.  All other tags are irrelevant.  Of course, it's
nice to think that reviews happen *after* the code was modified, which
is why most of us like to see the Reviewed-by after the initial author
signoff, but who added the tag has no DCO significance because it
doesn't affect the representations on the contribution.

Regards,

James



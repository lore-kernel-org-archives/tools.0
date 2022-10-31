Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309FD33DF;
	Mon, 31 Oct 2022 17:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1667237616;
	bh=M7h6WhlAAiIBPQDAKBVKeV7ZjlYX1GwgOYuPxB+zzSc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=TOut6cC/6Om0TNlyc9JjeWg9b0lSKjXUkWmmUW3nQ5TkL5DM4IVvyKtn1NeDoKIvl
	 5xOpbQU/YVazKU4KMwA3tOGN0PFDGAt0vOAtqO7lv7kjbRhTo4hYiaqb6356frocaa
	 hnFhpipSrI5VfMtdg306cxQ4zt6te4uR0P/EXJmI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 6C18C128657D;
	Mon, 31 Oct 2022 13:33:36 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVx1OY62Vwfx; Mon, 31 Oct 2022 13:33:36 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1667237609;
	bh=M7h6WhlAAiIBPQDAKBVKeV7ZjlYX1GwgOYuPxB+zzSc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=saIGs07FV+GOeP0D7AA5miXXKkZBTNJxpylv5JTv4uw529gOpKyNGvyav1SimsT1H
	 AuXu3ISR63SDLNzTzuTDsm28+DiDs2zcgPLIk2Mcab25MG7nfwJacbsUBfNQ9Zu3PV
	 +7ofV2ME5qRaZkfYcZGKoOZhUHyIma8M9V7Mjfjo=
Received: from [172.20.4.96] (unknown [160.72.53.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 3CDD1128652D;
	Mon, 31 Oct 2022 13:33:29 -0400 (EDT)
Message-ID: <9214fe10dee071bfc637fe1d90e251aa7f62480a.camel@HansenPartnership.com>
Subject: Re: DCO chain of custody revisited (was Re: [PATCH v4 08/11] mfd:
 qcom-pm8xxx: drop unused PM8018 compatible)
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tools@linux.kernel.org, users@linux.kernel.org
Date: Mon, 31 Oct 2022 13:33:27 -0400
In-Reply-To: <20221031172319.znosu3gleyipeje5@meerkat.local>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
	 <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
	 <Y1/qnCyav/S35mRo@google.com>
	 <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>
	 <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
	 <7b25ea15b6e508f435ca36967d9f4d4408f9a690.camel@HansenPartnership.com>
	 <20221031172319.znosu3gleyipeje5@meerkat.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2022-10-31 at 13:23 -0400, Konstantin Ryabitsev wrote:
> On Mon, Oct 31, 2022 at 01:10:58PM -0400, James Bottomley wrote:
> > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > Reviewed-by: Krzysztof Kozlowski <
> > > > krzysztof.kozlowski@linaro.org>
> > > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > 
> > > This would indicate that it's *Lee* who is claiming
> > > responsibility
> > > for collecting the Reviewed-by tag from Krzysztof, because it is
> > > in
> > > his chain of custody. However, this is not the case -- it was
> > > Neil
> > > who collected the tag, and therefore the "more correct" order
> > > should
> > > be:
> > > 
> > > > Reviewed-by: Krzysztof Kozlowski <
> > > > krzysztof.kozlowski@linaro.org>
> > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > 
> > > If my reasoning is incorrect, then I need to go back to the
> > > drawing
> > > board.
> > 
> > You're way over thinking this.
> 
> Yes, but it's my job to overthink this, so nobody else has to. :)
> 
> > The only tag that matters from the DCO point of view is Signed-off-
> > by. That's the ordering we care about for the chain of
> > custody.  All other tags are irrelevant.  Of course, it's nice to
> > think that reviews happen *after* the code was modified, which is
> > why most of us like to see the Reviewed-by after the initial author
> > signoff,
> 
> But this is where it becomes complicated. The Reviewed-By trailer was
> sent to the v2 of the series, and incorporated into v3(via b4
> trailers). If we stick it below Signed-off-by, then it may suggest
> that Krzysztof reviewed the v4 of the patch.

If the changes from v2 to v4 were material enough for that question to
be relevant then the Reviewed-by tag shouldn't have been kept because
the patch needed reviewing again.

> By placing it above the Signed-off-by line, we at least clearly
> indicate that it's Neil who put it there.

Who put it there does not matter, so it's not really a problem that
needs solving.

However, there is a problem if b4 is preserving Reviewed-by tags for
patches with material changes ... the review has to be redone and thus
the tag should be lost.  You can only keep Reviewed-by tags for
cosmetic changes (or obviously patches which don't change from version
to version).

James



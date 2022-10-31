Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFD97C;
	Mon, 31 Oct 2022 20:25:11 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 29VKG6Cu021656;
	Mon, 31 Oct 2022 21:16:06 +0100
Date: Mon, 31 Oct 2022 21:16:06 +0100
From: Willy Tarreau <w@1wt.eu>
To: Alex Elder <elder@ieee.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: DCO chain of custody revisited (was Re: [PATCH v4 08/11] mfd:
 qcom-pm8xxx: drop unused PM8018 compatible)
Message-ID: <20221031201606.GB21566@1wt.eu>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
 <Y1/qnCyav/S35mRo@google.com>
 <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>
 <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
 <7b25ea15b6e508f435ca36967d9f4d4408f9a690.camel@HansenPartnership.com>
 <20221031172319.znosu3gleyipeje5@meerkat.local>
 <89ce6b7a-3500-6026-0044-9916f5a567b7@ieee.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89ce6b7a-3500-6026-0044-9916f5a567b7@ieee.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Oct 31, 2022 at 12:33:30PM -0500, Alex Elder wrote:
> On 10/31/22 12:23 PM, Konstantin Ryabitsev wrote:
> > On Mon, Oct 31, 2022 at 01:10:58PM -0400, James Bottomley wrote:
> > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > > 
> > > > This would indicate that it's *Lee* who is claiming responsibility
> > > > for collecting the Reviewed-by tag from Krzysztof, because it is in
> > > > his chain of custody. However, this is not the case -- it was Neil
> > > > who collected the tag, and therefore the "more correct" order should
> > > > be:
> > > > 
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > > 
> > > > If my reasoning is incorrect, then I need to go back to the drawing
> > > > board.
> > > 
> > > You're way over thinking this.
> > 
> > Yes, but it's my job to overthink this, so nobody else has to. :)
> > 
> > > The only tag that matters from the DCO point of view is Signed-off-by.
> > > That's the ordering we care about for the chain of custody.  All other tags
> > > are irrelevant.  Of course, it's nice to think that reviews happen *after*
> > > the code was modified, which is why most of us like to see the Reviewed-by
> > > after the initial author signoff,
> > 
> > But this is where it becomes complicated. The Reviewed-By trailer was sent to
> > the v2 of the series, and incorporated into v3(via b4 trailers). If we stick
> > it below Signed-off-by, then it may suggest that Krzysztof reviewed the v4 of
> > the patch.
> > 
> > By placing it above the Signed-off-by line, we at least clearly indicate that
> > it's Neil who put it there.
> 
> I prefer this interpretation.  That is, the "outer" (last) sign-off
> is essentially indicating that everything within (above) it is what
> their sign-off applies to.
> 
> Most (all?) of the other tags (like Suggested-by, etc.) don't necessarily
> have a strong requirement or precise meaning, so in
> a way it doesn't matter that much.  But I think this convention
> adds a small amount of value.

At least for stable backports we've been using this a lot because we
often have to adapt patches that get backported, and it's often
convenient to add a small comment summarizing the changes after the
last s-o-b and before the backporter's. But I agree that most tags
probably do not care much about ordering if the contents are not
changed.

Sometimes a maintainer might reword a commit message and in this case
maybe the reviewed-by order may be relevant.

Willy

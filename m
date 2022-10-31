Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264618F52;
	Mon, 31 Oct 2022 21:33:08 +0000 (UTC)
Received: from letrec.thunk.org (guestnat-104-133-8-97.corp.google.com [104.133.8.97] (may be forged))
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 29VLTnJE030919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Oct 2022 17:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1667251792; bh=19DsnjZBbcrjzitVSUwFR+54FSioY0uGtcL5hkBs6P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HDmg7PWAUJ2Bc9m+cr78LTFXXI9ruRt98mg/Dv3ubnv3g+BYcRxW97Tmtgd0EQD+q
	 Bxhdc+kwBtuTClfW4Mf8EF3/dBuEihHCRoewXN+8cUWqYpHaIIs4BTjdP7M54xVehc
	 Xr9DukHUqkxEUOHT1vUFgI4MAen3d1Ex14R/L4uDtiNtFfxOE0IpsjJ7Z32ddX9mli
	 9HW3VEIq1RLMjKSymI0aabK6xPahpPY3z9xSh1giA9N8Y5M6Wgc5HOszD9DggrDG57
	 ntxZxNcA0cyVk4DN1A91bjooK56BanWcueA7QBhE5ofc63aGRu5lXR0q72ZVZcppI3
	 vemdwPmLqgSAA==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id B53EB8C2A08; Mon, 31 Oct 2022 17:29:48 -0400 (EDT)
Date: Mon, 31 Oct 2022 17:29:48 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: DCO chain of custody revisited (was Re: [PATCH v4 08/11] mfd:
 qcom-pm8xxx: drop unused PM8018 compatible)
Message-ID: <Y2A+TMwdsMn3C5Wm@mit.edu>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
 <Y1/qnCyav/S35mRo@google.com>
 <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>
 <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
 <7b25ea15b6e508f435ca36967d9f4d4408f9a690.camel@HansenPartnership.com>
 <20221031172319.znosu3gleyipeje5@meerkat.local>
 <9214fe10dee071bfc637fe1d90e251aa7f62480a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9214fe10dee071bfc637fe1d90e251aa7f62480a.camel@HansenPartnership.com>

On Mon, Oct 31, 2022 at 01:33:27PM -0400, James Bottomley wrote:
> Who put it there does not matter, so it's not really a problem that
> needs solving.
> 
> However, there is a problem if b4 is preserving Reviewed-by tags for
> patches with material changes ... the review has to be redone and thus
> the tag should be lost.  You can only keep Reviewed-by tags for
> cosmetic changes (or obviously patches which don't change from version
> to version).

What I've seen some reviewers do is to request some additional changes
(please add more details in the comments, or please drop the test if
the poitner is non-NULL before calling kfree(), and then they add the
Reviewed-by tag.  In fact, in some cases they explicitly say, "please
fix these things and then you may add "Reviewed-by: Jon Q. Random
<random@example.com>"

(For example, IIRC, Jan Kara does this a fair amount.)

I understand that b4 can't possibly parse english, and if it does
start gaining Skynet abilities, we've got bigger problems, but suffice
it to say, there *are* times the Reviewed-By tag should be kept even
though non-commit-description and/or non-commit changes were made.

       			      	     			     - Ted


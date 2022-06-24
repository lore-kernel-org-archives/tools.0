Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D333D84;
	Fri, 24 Jun 2022 16:05:41 +0000 (UTC)
Received: from letrec.thunk.org (c-24-1-67-28.hsd1.il.comcast.net [24.1.67.28])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 25OG5VdM009882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 12:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1656086734; bh=7u/+C0jxg0wEwrWq3D8PbIIuADvIqrkEXd+MOZUBSps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ny30FXHG4fjhXJRhwoF1m/r4E0E3PdsW0GmzdMYUrYsD67Lzssu1MuwALjUbV7dXe
	 ZQxv15vIiSyg4aVQOzNSKikyRZi315Cu+PN2ZwwAPxDd3db0M3pAzj5QLIgCG3T9hA
	 2uajeIcaxM/dCeka+1D/jlwzFbKiqjXPVM3RLzDuhZvcNKJHfY6iSTYp9NyFEL8gqY
	 MYlnCfGgIGau+J1dFJhz4MUqOKXBxX3R18vTZcX722LMbcuKuRGLWPSiAImcqTeNad
	 fbFvVA/y7x34uO0SUa1hRB/oV/NAak1fDWwQrHR0tV745ejesBagb86V1SraL686Bi
	 fp1xTValMVx9g==
Received: by letrec.thunk.org (Postfix, from userid 15806)
	id 3F2D98C3495; Fri, 24 Jun 2022 12:05:31 -0400 (EDT)
Date: Fri, 24 Jun 2022 12:05:31 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Mark Brown <broonie@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
        users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrXgy0qYeBnjREfK@mit.edu>
References: <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper>
 <YrT4LIq6ssD1mhMQ@mit.edu>
 <20220624135147.GA23621@ziepe.ca>
 <YrXYaE12VFUDucsN@mit.edu>
 <YrXZmtwm705pSkuG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrXZmtwm705pSkuG@sirena.org.uk>

On Fri, Jun 24, 2022 at 04:34:50PM +0100, Mark Brown wrote:
> 
> I gather some people use patman for that already:
> 
>    https://gitlab.com/u-boot/u-boot/tree/master/tools/patman
> 
> (I've got my own thing which predates me knowing that patman exists).

Oh wow, cool, this looks nice!  Thanks for pointing this out!

I see it has patchwork integration, although apparently it doesn't
have automated handling for lore.kernel.org links (at least, not yet).

					- Ted



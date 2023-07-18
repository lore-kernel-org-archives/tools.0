Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B48AD4B;
	Tue, 18 Jul 2023 08:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D6FC433C7;
	Tue, 18 Jul 2023 08:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689669483;
	bh=S9t5MtMHJEDufEE8ih79gXKnEBkiid37ZOrO7a8AcV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9/2FEPGeSUMYf8lInpjdkohOvqyBTWnLAc1g+FjtCfQ+6qFem+zQdr0ta0CROXJz
	 upyry3DR92O/Ji3aqQjBuKK0C14ipdDXB/cFEZjn4Dz7ccidJNOAgihjUP3cGDqf9X
	 RuEmu+Ia5QBdjS9Y46YmPczT2j3ub0fsw+dspNeom2I0+JHKlcnMAjtsdC/O9wreXp
	 D7+EgOPr5LOEkilvWxV67Txz2Hlv9xutf/UpuiojE9wj1333TdlDMX/DihhCAp/DpO
	 zRZBbu2ROvYwiqbR6YJ/6FhEZqV2WRdsjzJNu5AkWJZWazf/hObfMfNEft3IwssyG0
	 oBZ4Qi9eOFhdw==
Date: Tue, 18 Jul 2023 09:37:59 +0100
From: Lee Jones <lee@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4: ty: Feature request - configuration option to send to
 'myemail'
Message-ID: <20230718083759.GF1082701@google.com>
References: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>
 <20230714-apple-broken-5591b8@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714-apple-broken-5591b8@meerkat>

On Fri, 14 Jul 2023, Konstantin Ryabitsev wrote:

> On Thu, Jul 13, 2023 at 09:58:34PM +0100, Lee Jones wrote:
> > Good evening Konstantin,
> > 
> > I notice that `b4 ty` forcibly scrubs 'myemail' from the recipients list [0].
> > 
> > Is there a good way to ensure `b4 ty`s reply ends up in my Mutt based inbox?
> > 
> > If not already possible, would it be plausible to prevent the
> > scrubbing?  Perhaps behind a config option?
> > 
> > Thanks for you consideration.
> 
> I'll think about it -- maybe we can set b4.ty-not-metoo that defaults to true.
> 
> bugbot assign to me

That would be fabulous.  Thanks for considering.

-- 
Lee Jones [李琼斯]

Received: from sipsolutions.net (sipsolutions.net [144.76.43.62])
 by mx.groups.io with SMTP id smtpd.web12.12393.1584741832944530972
 for <tools@linux.kernel.org>;
 Fri, 20 Mar 2020 15:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: sipsolutions.net, ip: 144.76.43.62, mailfrom: johannes@sipsolutions.net)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	(envelope-from <johannes@sipsolutions.net>)
	id 1jFPk6-00C0u6-H3; Fri, 20 Mar 2020 23:03:50 +0100
Message-ID: <40b68e30fa106d65d0e8451d057ec338a3e002ab.camel@sipsolutions.net>
Subject: Re: [kernel.org users] B4 and gmail integration features
From: "Johannes Berg" <johannes@sipsolutions.net>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Date: Fri, 20 Mar 2020 23:03:49 +0100
In-Reply-To: <20200320220138.axvbfnlmzaajvkwh@chatter.i7.local> (sfid-20200320_230146_618107_4EAB0D91)
References: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
	 <516a16778778f90f7d2f7d5a7ef392118fc90f28.camel@sipsolutions.net>
	 <20200320220138.axvbfnlmzaajvkwh@chatter.i7.local>
	 (sfid-20200320_230146_618107_4EAB0D91)
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-20 at 18:01 -0400, Konstantin Ryabitsev wrote:
> On Fri, Mar 20, 2020 at 10:49:13PM +0100, Johannes Berg wrote:
> > On Fri, 2020-03-20 at 17:45 -0400, Konstantin Ryabitsev wrote:
> > > 3. Optionally, also send a "thanks, applied" templated reply after you 
> > >    do "b4 am"
> > 
> > I've always thought that somehow this ought to be delayed somehow, since
> > I may apply a patch just to look at it, or to run tests, etc. and then
> > really only make up my mind when I push it out ...
> 
> How about we just "remember to thank" and have a separate command "b4 
> thank" which will interactively verify patch/series before actually 
> sending out the "thanks, applied"?

I think that'd be useful, at least as an option.

Even better if you could run a script there to thank, so that could e.g.
also close patchwork patches at that stage? Once we get patchwork with
msgids :)

johannes


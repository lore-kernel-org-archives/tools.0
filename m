Received: from sipsolutions.net (sipsolutions.net [144.76.43.62])
 by mx.groups.io with SMTP id smtpd.web11.11980.1584740957290047940
 for <tools@linux.kernel.org>;
 Fri, 20 Mar 2020 14:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: sipsolutions.net, ip: 144.76.43.62, mailfrom: johannes@sipsolutions.net)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	(envelope-from <johannes@sipsolutions.net>)
	id 1jFPVy-00Bz0b-JN; Fri, 20 Mar 2020 22:49:14 +0100
Message-ID: <516a16778778f90f7d2f7d5a7ef392118fc90f28.camel@sipsolutions.net>
Subject: Re: [kernel.org users] B4 and gmail integration features
From: "Johannes Berg" <johannes@sipsolutions.net>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users@linux.kernel.org, tools@linux.kernel.org
Date: Fri, 20 Mar 2020 22:49:13 +0100
In-Reply-To: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
References: <20200320214532.wvmym643l3dw24qh@chatter.i7.local>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-20 at 17:45 -0400, Konstantin Ryabitsev wrote:
> 
> 3. Optionally, also send a "thanks, applied" templated reply after you 
>    do "b4 am"

I've always thought that somehow this ought to be delayed somehow, since
I may apply a patch just to look at it, or to run tests, etc. and then
really only make up my mind when I push it out ...

johannes


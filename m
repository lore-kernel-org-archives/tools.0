Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF09D4C6D;
	Wed, 20 Jul 2022 13:06:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3C3B1576;
	Wed, 20 Jul 2022 06:06:28 -0700 (PDT)
Received: from bogus (unknown [10.57.12.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAF7B3F70D;
	Wed, 20 Jul 2022 06:06:26 -0700 (PDT)
Date: Wed, 20 Jul 2022 14:06:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220720130623.3uymupzabunbrbme@bogus>
References: <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
 <20220718181732.GC5049@ziepe.ca>
 <CAMuHMdWgjimmGRxP6kLK_mzv3Fo=5S6SjYj5sbk24eSHLWKZHg@mail.gmail.com>
 <20220718231012.GE5049@ziepe.ca>
 <CAMuHMdUQiMwcC=r5NUZzniLC1qLkfcsB0rj+VnGm15+-ztjRqA@mail.gmail.com>
 <Ytae3XK2uA5z93rV@sirena.org.uk>
 <CAMuHMdWY1XSVabvkVfXqWUqWLwnp4K0gA36fAR_O0NRiUHx=XQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWY1XSVabvkVfXqWUqWLwnp4K0gA36fAR_O0NRiUHx=XQ@mail.gmail.com>

On Tue, Jul 19, 2022 at 02:28:02PM +0200, Geert Uytterhoeven wrote:
> Hi Mark,
> 
> On Tue, Jul 19, 2022 at 2:09 PM Mark Brown <broonie@kernel.org> wrote:
> > On Tue, Jul 19, 2022 at 09:02:40AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Jul 19, 2022 at 1:10 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > See 'git-tag(1)' "On Re-tagging" for a discussion on why changing tags
> > > > that have been pushed is a bad idea. There are many troublesome
> > > > behaviors here.
> >
> > > > Tags are not a solution to store the cover letter during development..
> >
> > > Oh, I always write my cover letters _after_ development, just before
> > > sending out my series.
> >
> > I tend to find that's less true for followup versions - when revising a
> > series I tend to add to the inter version changelog as I go through
> > making changes.
> 
> You don't add per-patch inter-version changelogs below the "---",
> and collect them all in the cover letter (plus optional rewriting)
> just before sending the new version?
>

I just noticed the same after sending out few fixes[1] using b4 summit.
I didn't use --send directly though as I wanted to add a note in one of the
patch. Also noticed the Subject line broke at the very beginning in 1/3
which git send-email complained and I fixed, not sure if that is an issue
if b4 is used to send email as well.

Sorry for replying here with other comments/feedback as well but the diff
stat missing is main thing and hence I used this thread.

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20220720-arch_topo_fixes-v3-0-43d696288e84@arm.com/

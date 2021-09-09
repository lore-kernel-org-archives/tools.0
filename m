Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63003FC8;
	Thu,  9 Sep 2021 12:49:09 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 16E77604E9;
	Thu,  9 Sep 2021 12:49:09 +0000 (UTC)
Date: Thu, 9 Sep 2021 08:49:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Lee Jones <lee.jones@linaro.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210909084907.271b6df5@gandalf.local.home>
In-Reply-To: <20210908183746.iancht34j3drun77@meerkat.local>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
	<20210902195332.GA2493828@nvidia.com>
	<20210902201402.bbdttirbb5ckrtiz@meerkat.local>
	<CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
	<20210903152143.nt5mzgwprltl36pa@meerkat.local>
	<CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
	<20210908183746.iancht34j3drun77@meerkat.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Sep 2021 14:37:46 -0400
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> > Can we represent LKML on Patchwork as a reasonable alternative?  
> 
> No. That said, what I'm currently working on is a way to provide query-defined
> public-inbox sources. If you can define what kind of patches you are
> interested in as a lore.kernel.org query, we can save that search and feed
> *that* into patchwork. So, instead of feeding all of LKML into patchwork just
> for the few patches you're interested in, we can just feed the subset of
> patches that you actually want.

This is basically what I have done locally. I set up a local instance of
patchwork. Added a procmail filter to copy all my emails with "PATCH" in the
subject into its own folder. Then I have a cron job that runs the following
script to add "List-ID: <rostedt.inbox.com>" to these emails, as my local
patchwork "listens" to the "mailing list" called "rostedt.inbox.com". And
then send them off to my local patchwork instance.

#!/usr/bin/perl -w

my $state = "none";
my $patch = 0;

while (<>) {
        if (/^From /) {
                $state = "head";
                $patch = 0;
        } elsif ($state eq "head") {
                if (/^\s*$/) {
                        print "List-ID: <rostedt.inbox.com>\n" if ($patch);
                        $state = "body";
                } else {
                        if (/list-id/i) {
                                next;
                        } elsif (/^Subject.*patch/i) {
                                $patch = 1;
                        }
                }
        }
        print;
}


This works great for me, but I can imagine if people have their own public
inboxes, where we can just create a patchwork instance that feeds off of
these inboxes, I believe you will get the same functionality that I have.

Note, I also have filters to read patches that have "[for-next]" and
"[for-linus]" which converts the patches in patchwork from "New" to "Under
Review". Then I have a subscription to all commits that go into Linus's
tree, and I process all of them to go through and "Approve" any patch that
it finds.

I still would love a way to download patchwork offline, where it loads
locally all pending patches, and lets you review / apply them locally
without needing to be connected online, as this would be useful during
flights. Then when you land, you can upload your changes.

-- Steve

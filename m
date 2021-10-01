Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D429CA;
	Fri,  1 Oct 2021 17:01:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF40461353;
	Fri,  1 Oct 2021 17:01:38 +0000 (UTC)
Date: Fri, 1 Oct 2021 13:01:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kees Cook <keescook@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, tools@linux.kernel.org,
 users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <20211001130137.3c83dfee@oasis.local.home>
In-Reply-To: <202109301630.C2646F8B5@keescook>
References: <202109301023.B78ABE54B@keescook>
	<20210930200002.67vxbowvegso2zhg@meerkat.local>
	<202109301559.A9BFB03@keescook>
	<20211001092914.4738513b@canb.auug.org.au>
	<202109301630.C2646F8B5@keescook>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Sep 2021 16:42:58 -0700
Kees Cook <keescook@chromium.org> wrote:

> Now I publish my tree, and sign a tag for it for a pull request. Whoever
> does that pull can only check my tag and has to trust I checked what
> went into my tree. At the end of the day, that's exactly what the
> tag signature is for: whoever is pulling must trust the PR sender for
> all kinds of reasons. But there isn't a way to mechanically perform an
> integrity check on the components of those results: the merged mbox with
> the signature headers or the remote tag signature aren't associated
> with the resulting branch any more.

As I've mentioned before, I have a personalized patchwork instance that
runs against my inbox. I pull from that patchwork to pull into my git
tree (which all patches must at least go to LKML). I also subscribe to
all commits that go into Linus's tree, and those patches run against
the patches in my inbox patchwork database. If a match is found, the
patch changes from "Under Review" (which gets set to that when it's
posted as my "for-next" or "for-linus" emails) to "Accepted", and they
no longer appear in my default view.

Thus, if the patch changes for the time I reviewed it, to the time it
gets into Linus's tree, that patch will not be removed from my
patchwork database. Which causes me to examine further.

> 
> But given that maintainers may tweak what was sent to them or squash
> fixes, there's likely no point in that kind of integrity chain...

I sometimes make slight changes, usually do to conflicts with other
changes. In these cases, I have to manually set the patches in my
database to "Accepted", but I don't do that without manually examining
what is in Linus's tree and what is in patchwork.

-- Steve

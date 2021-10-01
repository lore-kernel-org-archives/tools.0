Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5F529CA;
	Fri,  1 Oct 2021 17:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1633108026;
	bh=rlTt3LCoomrbqxww7n3cOC99yDdnfQki3GDCP/nS9bg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=uocFGjU3VcUPIypTrVdpl+8F2+aKa8YTp9gMkeKK5lZy+FpzjrhUzPjhjmYlWRJlw
	 CDIpOlJYvMK/DWBi5/j/C+6v29TA6P8pjn/4jM3rEc61qpTLvyMkc9whjvoudbodf8
	 /jOtZC8L1hy0ZaW6Z19hA1Y/HFwJPA/bpnPdKFQo=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id A9A1E12806AB;
	Fri,  1 Oct 2021 10:07:06 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUItKfi04oFX; Fri,  1 Oct 2021 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1633108026;
	bh=rlTt3LCoomrbqxww7n3cOC99yDdnfQki3GDCP/nS9bg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=uocFGjU3VcUPIypTrVdpl+8F2+aKa8YTp9gMkeKK5lZy+FpzjrhUzPjhjmYlWRJlw
	 CDIpOlJYvMK/DWBi5/j/C+6v29TA6P8pjn/4jM3rEc61qpTLvyMkc9whjvoudbodf8
	 /jOtZC8L1hy0ZaW6Z19hA1Y/HFwJPA/bpnPdKFQo=
Received: from [172.20.71.139] (unknown [209.210.2.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 4BE1412804E1;
	Fri,  1 Oct 2021 10:07:06 -0700 (PDT)
Message-ID: <cef357f1ee179c8250fa1507eea7fe39e6ee2e78.camel@HansenPartnership.com>
Subject: Re: merging pull requests
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Kees Cook <keescook@chromium.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	tools@linux.kernel.org, users@linux.kernel.org
Date: Fri, 01 Oct 2021 10:07:05 -0700
In-Reply-To: <202109301630.C2646F8B5@keescook>
References: <202109301023.B78ABE54B@keescook>
	 <20210930200002.67vxbowvegso2zhg@meerkat.local>
	 <202109301559.A9BFB03@keescook> <20211001092914.4738513b@canb.auug.org.au>
	 <202109301630.C2646F8B5@keescook>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-09-30 at 16:42 -0700, Kees Cook wrote:
[...]
> The only "hole" I see with the integrity checking is that since only
> tags or mbox headers are signed, and those aren't part of the merge,
> there isn't a easy way that I see to follow the integrity chain for a
> given resulting tree. (Which is technically different from the
> "trust" chain.)
> 
> For example, for stuff going into my tree:
> - If it's from an mbox, I can easily check that the patches haven't
> changed
>   in flight when the author used b4/patatt to wrap the email
> delivery.
> - If it's from a remote tag, I can check the tag signature.
> This is all fine.
> 
> Now I publish my tree, and sign a tag for it for a pull request.
> Whoever does that pull can only check my tag and has to trust I
> checked what went into my tree. At the end of the day, that's exactly
> what the tag signature is for: whoever is pulling must trust the PR
> sender for all kinds of reasons. But there isn't a way to
> mechanically perform an integrity check on the components of those
> results: the merged mbox with the signature headers or the remote tag
> signature aren't associated with the resulting branch any more.
> 
> But given that maintainers may tweak what was sent to them or squash
> fixes, there's likely no point in that kind of integrity chain...

Well, I think you need to re-examine what it is we're attesting to
cryptographically.  We already have an attestation process, it's called
the Signed-off-by: chain.  The DCO is very specific, either: it's your
contribution; a contribution with attribution you modified or it's an
unmodified contribution from another.  This is the base level of legal
attestation the maintainers do and which we're very careful to get
right.  If you want to try and express this crytpographically, that's
fine, but it must match the workflow we currently use.

James



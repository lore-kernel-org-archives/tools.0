Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EAF15357F
	for <tools@linux.kernel.org>; Fri,  3 May 2024 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714742539; cv=none; b=fYpeW92Qkd+u19AgkmgMe4l4ar1hFG1xDGEYgm7UAU1Y2Rk5NUaF2Hc9NiUFKegEZ8WKdFp9reOmNC/ofNfgGXz5lzDVIKFd9R/8gvOz/2tfXml1DWBHU/vHHFEk91Bn5b+NyILqwzXdq1kR4IkaP3VlD4Go3xvn6PbLFcE7N9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714742539; c=relaxed/simple;
	bh=o3lFTfErFFmxDVds5y5aBk+JNVOpL6if8ksgiaCU0XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsXNlMLeph2c9mD/Ol3H9m1Ldg8rrvD5Ou4kvFesuFxSYdhewia111oOUxA2KdnpClAk00bw2nsp5ppSAD2OykcAq6opGO6UgmNMAVBdiJVLfVcs1dYVXhUCl+DWM/lb0vFUZx7jtHQbXwPx6cJejD4ZNsMolqmmoHU2514OM2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IHp11Qkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IHp11Qkf"
Received: by smtp.kernel.org (Postfix)
	id 80DE5C4AF14; Fri,  3 May 2024 13:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49307C116B1;
	Fri,  3 May 2024 13:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714742538;
	bh=o3lFTfErFFmxDVds5y5aBk+JNVOpL6if8ksgiaCU0XE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHp11QkfJe0tl3rlM2Pg5yqYUESlTAMrlq0sXTLJd6FeM+C/nXEaPgRr7f4Je+a4A
	 3HQ8LWWt3QVK2qLohTLkeIlEihWxBAKbinOk8PJEAiYNHepenK8mQ33RlLNI+df0Zb
	 G8q4JUQZNDa9AJTJNZgGsU5tZd1FZ+j5PZfpkfOY=
Date: Fri, 3 May 2024 09:22:17 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Joel Granados <j.granados@samsung.com>
Cc: tools@kernel.org
Subject: Re: b4 is bringing a bit too many trailers
Message-ID: <20240503-tourmaline-jellyfish-of-luxury-9da3cd@meerkat>
References: <CGME20240503120511eucas1p2a3362abf193471c9b56bd7c2cdcbb79d@eucas1p2.samsung.com>
 <20240503120506.p7g5nn6jocrrdlck@joelS2.panther.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503120506.p7g5nn6jocrrdlck@joelS2.panther.com>

On Fri, May 03, 2024 at 02:05:06PM GMT, Joel Granados wrote:
> 2. I do a `b4 trailers -u -F "20240501-jag-sysctl_remset_net-v6-0-370b702b6b4a@samsung.com"`
>    to bring in all the trailers from v6.

FYI, you don't need to pass -F here -- we'll find everything using the
change-id.

> 3. It adds the following trailers:
>       Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
>       Acked-by: Chuck Lever <chuck.lever@oracle.com>
>       Reviewed-by: Jeffrey Layton <jlayton@kernel.org>
>       Acked-by: Allison Henderson <allison.henderson@oracle.com>
>       Tested-by: Valentin Schneider <vschneid@redhat.com>
>       Reviewed-by: Valentin Schneider <vschneid@redhat.com>
>       Reviewed-by: Muchun Song <muchun.song@linux.dev>
>       Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
>       Acked-by: Kees Cook <keescook@chromium.org>
> 
> 4. The first 4 are valid trailers for "20240501-jag-sysctl_remset_net-v6-0-370b702b6b4a@samsung.com"
>    But the last 5 are not.

Hmm... I cannot replicate this. Here's my test session:

First, I recreate your series locally:

    $ b4 prep -n test-trailers-u -F https://lore.kernel.org/all/20240501-jag-sysctl_remset_net-v6-0-370b702b6b4a@samsung.com/
    Checking attestation on all messages, may take a moment...
    ---
      ✓ [PATCH v6 1/8] net: Remove the now superfluous sentinel elements from ctl_table array
      ✓ [PATCH v6 2/8] net: ipv{6,4}: Remove the now superfluous sentinel elements from ctl_table array
      ✓ [PATCH v6 3/8] net: rds: Remove the now superfluous sentinel elements from ctl_table array
      ✓ [PATCH v6 4/8] net: sunrpc: Remove the now superfluous sentinel elements from ctl_table array
      ✓ [PATCH v6 5/8] net: Remove ctl_table sentinel elements from several networking subsystems
      ✓ [PATCH v6 6/8] netfilter: Remove the now superfluous sentinel elements from ctl_table array
      ✓ [PATCH v6 7/8] appletalk: Remove the now superfluous sentinel elements from ctl_table array
      ✓ [PATCH v6 8/8] ax.25: x.25: Remove the now superfluous sentinel elements from ctl_table array
      ---
      ✓ Signed: openpgp/j.granados@samsung.com
    ---
    Created new branch b4/test-trailers-u
    Applying 8 patches
    ---
    Applying: net: Remove the now superfluous sentinel elements from ctl_table array
    Applying: net: ipv{6,4}: Remove the now superfluous sentinel elements from ctl_table array
    Applying: net: rds: Remove the now superfluous sentinel elements from ctl_table array
    Applying: net: sunrpc: Remove the now superfluous sentinel elements from ctl_table array
    Applying: net: Remove ctl_table sentinel elements from several networking subsystems
    Applying: netfilter: Remove the now superfluous sentinel elements from ctl_table array
    Applying: appletalk: Remove the now superfluous sentinel elements from ctl_table array
    Applying: ax.25: x.25: Remove the now superfluous sentinel elements from ctl_table array
    ---
    NOTE: any follow-up trailers were ignored; apply them with b4 trailers -u

Then, I run the command you provided:

    $ b4 trailers -u -F "20240501-jag-sysctl_remset_net-v6-0-370b702b6b4a@samsung.com"
    Calculating patch-ids from commits, this may take a moment...
    Checking change-id "20240311-jag-sysctl_remset_net-d403a1a93d6b"
    Grabbing search results from lore.kernel.org
    Looking for additional code-review trailers on lore.kernel.org
    ---
      net: Remove the now superfluous sentinel elements from ctl_table array
        + Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
      net: ipv{6,4}: Remove the now superfluous sentinel elements from ctl_table array
        + Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
      net: rds: Remove the now superfluous sentinel elements from ctl_table array
        + Acked-by: Allison Henderson <allison.henderson@oracle.com> (✓ DKIM/oracle.com)
        + Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
      net: sunrpc: Remove the now superfluous sentinel elements from ctl_table array
        + Reviewed-by: Jeffrey Layton <jlayton@kernel.org> (✓ DKIM/kernel.org)
        + Acked-by: Chuck Lever <chuck.lever@oracle.com> (✓ DKIM/oracle.com)
        + Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
      net: Remove ctl_table sentinel elements from several networking subsystems
        + Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
      netfilter: Remove the now superfluous sentinel elements from ctl_table array
        + Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
      appletalk: Remove the now superfluous sentinel elements from ctl_table array
        + Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
      ax.25: x.25: Remove the now superfluous sentinel elements from ctl_table array
        + Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>
    ---
    Invoking git-filter-repo to update trailers.
    New history written in 1.55 seconds...
    Completely finished after 1.89 seconds.
    Trailers updated.

I can't seem to be able to bring in these trailers from your list:

>       Tested-by: Valentin Schneider <vschneid@redhat.com>
>       Reviewed-by: Valentin Schneider <vschneid@redhat.com>
>       Reviewed-by: Muchun Song <muchun.song@linux.dev>
>       Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

Notably, the Acked-by from Kees Cook is already in your series since v4, so
we'll ignore it for the moment.

> 5. Here is where I think the others came from:
>   5.1 "Acked-by: Kees Cook <keescook@chromium.org>":
>       can be found here https://lore.kernel.org/all/202404150906.C37D8D9DA1@keescook/ but
>       it is part of "[PATCH 0/7] sysctl: Remove sentinel elements from misc directories"
> 
>   5.2 "Reviewed-by: Muchun Song <muchun.song@linux.dev>"
>       "Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>"
>       can be found here https://lore.kernel.org/all/0e35e88d-3ea1-4f62-77e4-eb12e9f51583@huawei.com/
>       and here  https://lore.kernel.org/all/8E19B519-9035-42E0-92DC-7C21471543D8@linux.dev/
>       but it is part of "[PATCH 0/7] sysctl: Remove sentinel elements from misc directories"

No matter how I try, I'm not able to bring these into your series. Even if I
pass that thread as -F to the trailers command, I'm still not able to have
them applied. So, I'm not sure what is going on, unfortunately.

Can you remove these trailers from your local series with `git rebase -i` and run:

    b4 -d trailers -u 2>/tmp/trailers-u-debug.out

If you still get those trailers pulled in, I'd love to see the debug output
for it.

Cheers,
-K

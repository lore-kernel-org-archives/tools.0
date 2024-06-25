Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439D24437A
	for <tools@linux.kernel.org>; Tue, 25 Jun 2024 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719337601; cv=none; b=Lze99i3YPHvYwZ31+JKzn4HnsBcK9hBc4eKsYMVu6+2g2wJ9DpzpusPlI7qMqpuXukbzJEk/7VD6wux0uXOEjKbueURwpmR+JfRehQTb2t+DVYfbYqBXZ4/rvb6tZjiQK8KlYQ47NxHWHPxwS7EUkGkE0NLASbBvxh/EHCyCGwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719337601; c=relaxed/simple;
	bh=4izrAl3ueriJRqlr0593yBl7zIhDZ+gfZQHFA3qgPAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7csessNCQd0L4YgGl/FOFGeqIUN/QMde5Tq1sfWLQ7s09Y3YYjqFgmCKY7wgPCOsUei4tuxV/ZLSQ6jofRlWU3YOYJeOt57w/DD4DWPBMz0dyT35z3LTb80PW8DWU2QeCWUM2jPD7JFxO12Am4UfvIK1UVRy5PIKPVRXaWmWFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zY0PwvZQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zY0PwvZQ"
Received: by smtp.kernel.org (Postfix)
	id B7ECEC32786; Tue, 25 Jun 2024 17:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9B3C32781;
	Tue, 25 Jun 2024 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719337600;
	bh=4izrAl3ueriJRqlr0593yBl7zIhDZ+gfZQHFA3qgPAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zY0PwvZQVv0GvCi8RIMLtUw0A1vpv5L+LKdHf0lq4qJQVnrcxerScuM45Vq+SiRp4
	 tOpvVpeuxgMCJq/3PD5ecP2YvwhFOlTNVOK15rk5toJshrN2BbBqX/ZgMIvrOWB7+4
	 QqcAyWFICulkXujGcFM25EiV6XOV24uCwv1WU99I=
Date: Tue, 25 Jun 2024 13:46:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: tools@kernel.org
Subject: Re: b4 prep confused by rebase from linus/master to
 linux-next/master?
Message-ID: <20240625-bald-ultraviolet-toad-9618cd@lemur>
References: <fd4e083f-fd5b-490c-b0c6-4cae0acc6214@quicinc.com>
 <20240625-sepia-tarantula-of-diversity-adee66@lemur>
 <b4bdcc6e-95fe-41ae-bedc-9fc4ad385570@quicinc.com>
 <20240625-voracious-flashy-galago-7632ec@lemur>
 <9cff56e8-c529-4acf-a66f-82e0a3c533d8@quicinc.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9cff56e8-c529-4acf-a66f-82e0a3c533d8@quicinc.com>

On Tue, Jun 25, 2024 at 10:35:46AM GMT, Jeff Johnson wrote:
> Correct. I'm currently using cover-strategy: branch-description
> I kept stumbling across issues with the default strategy so I moved to the
> branch description strategy.
> 
> And it seems that doesn't work well with b4 prep --cleanup either since it
> seems to remove the metadata but doesn't actually remove the branch.

Hmm... that would be a bug. It's not shocking, because non-default cover
strategies see a lot less testing.

Do you mind sending a separate message to this list describing the problem you
saw with --cleanup? This way I can turn it into a bug.

-K

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04DA38DF9
	for <tools@linux.kernel.org>; Fri, 27 Jun 2025 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046409; cv=none; b=aG0bC1Vf57tVm1ZUmCqctMfuVCgOPg+lOSHQfFb0vcXcLKqXbpo9FB0CHNAsR/lImwTFaBrwHHtP8rKY6WP15TESv7qi6qxJe2Go/y0d1Lp2oE5L1uJqQi7i6JXpnpM42veKsK1Yq2IKw7PDCcbjz6pM8wc92N93L/hGEBwZKgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046409; c=relaxed/simple;
	bh=LGIEAqSGQJ8P9IWIPMt2JWcl0vcj95GdOlJtYUWZaq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdd0yW99eGkJpJsTCVYi+HDwomJOeF5gOaYLviWfgUwdZFsbKhRzE5VaJmJuWYZkg0XaIgHpYMyUe7c/o7Yzv5UyG8ChqGa5G496AGf43Sg66a8RpAXUR3/w8FKxRrWrTCU/5EJ5f/EqnpJYkCuRXE1zPMU1obJhyMwxiaBSlAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z64NXt9b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z64NXt9b"
Received: by smtp.kernel.org (Postfix)
	id 4F0B8C4CEEF; Fri, 27 Jun 2025 17:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07584C4CEE3;
	Fri, 27 Jun 2025 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751046409;
	bh=LGIEAqSGQJ8P9IWIPMt2JWcl0vcj95GdOlJtYUWZaq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z64NXt9bVKj/Zp0rzqb8B3voF54kb6dU/DA3IF66CTC7JR7UNRVrxXODQ0s+S2suJ
	 jFnEesvb7ncFbmaK6SCRqaQAevWsIWUmQ9bZARptys0hDwYbfIIUXduK9/J3KsLXbb
	 J1SQmg8eedrIOOlqGDjySpH5hiJVHrLjPpZaDSSs=
Date: Fri, 27 Jun 2025 13:46:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Juri Lelli <juri.lelli@gmail.com>
Cc: tools@kernel.org
Subject: Re: b4: Fail to send series with smtpAuth none
Message-ID: <20250627-rousing-pumpkin-rattlesnake-5d1cfe@lemur>
References: <CAE-h8tF9rp1B22YhC6PPUFntst9BEZzcCiyy-Mzjq2pQwEnAgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAE-h8tF9rp1B22YhC6PPUFntst9BEZzcCiyy-Mzjq2pQwEnAgg@mail.gmail.com>

On Thu, Jun 26, 2025 at 04:37:30PM +0200, Juri Lelli wrote:
> My SMTP server doesn't seem to require authentication for sending
> patches, git send-emails works well with 'smtpAuth = none' in
> .gitconfig. b4, however, seems to ignore that configuration and keeps
> asking for a password (and then fails to send).
> 
> Is this a known issue? How can I fix/workaround it?

It is known now. :)

bugspray tag me

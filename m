Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625D784037
	for <tools@linux.kernel.org>; Tue,  2 Apr 2024 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712067825; cv=none; b=YdUeZoOjqmGyk1+fnJzYMWiVTVHyBw4xDbhIjI//WC5pOUTrZuxBxrcaoTdJT+FEYIRkpiZPMeJn7tQ7GfKFzgR0XaGtXvyxwwukofkTz9SuTnQY/NVI+GHtKgXyP2lbtzCqx+2t35huvCTZ2Ba4Evtnsw2oX+/cXXNkuDDRI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712067825; c=relaxed/simple;
	bh=1USqAR4irzsodL21v8XAnSQZDvoRJ4CG8CvHMrYenIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRnmGmavpbycCNdSpTNK1ife8j3pigsZbCvlN4dy6ln4x6fnclpEHiA+hyHHnOXg1P71aFqHTaD7GZ+v3V+EqxvGPkmIT/KrYwvrzh5LLlwBE/zkuPl+z1mAsynisp/HaMuIokQjU3p4WNu3VPhnYu4OF+TzJaMB6496lDkw6XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ls/1PYpg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ls/1PYpg"
Received: by smtp.kernel.org (Postfix)
	id E8732C433C7; Tue,  2 Apr 2024 14:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3736C433F1;
	Tue,  2 Apr 2024 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712067824;
	bh=1USqAR4irzsodL21v8XAnSQZDvoRJ4CG8CvHMrYenIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ls/1PYpgvfsP1Z0hT8p3IiBVYdn3dgkyRyYAa2WYFyPK8o/8s6PMkCaH9uQx6RzXc
	 bZKxy31+dtjnQobknyNjTTIHwf6BinOm3j8kZcBa+0eYVi7yYkVUH8wSoK5W0abXfl
	 37zMZaHHfSt5lK6zdOs3vfHQjiACMCDDX/vvuYa8=
Date: Tue, 2 Apr 2024 10:23:43 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: tools@kernel.org
Subject: Re: "b4 send" does not respect sendemail.smtpserveroption
Message-ID: <20240402-delicate-steel-pelican-58dbd1@lemur>
References: <Zgq-lE2PqA7pdgid@probook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zgq-lE2PqA7pdgid@probook>

On Mon, Apr 01, 2024 at 04:03:00PM +0200, J. Neuschäfer wrote:
> Hello,
> 
> first of all thanks for writing/maintaining B4!
> 
> I noticed that "b4 send", when using a sendmail-like MTA, doesn't add
> the options specified in sendemail.smtpServerOption to the command line,
> resulting in different behavior between "git send-email" and "b4 send"
> in some configurations.

Right, we only support a subset of git-send-email functionality at this time.
We should, however, support this particular setting.

bugbot assign to me

-K

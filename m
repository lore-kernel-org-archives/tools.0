Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460AA2F12D4
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 01:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772759206; cv=none; b=fAhOu3PlWN75iR2v47VXvLm1ln7NZhICdXoflRGM9v6HNHXRbpfjy0zUb8b1mM8E4YqyswKU4jKbNAIEPfylGRLzikjgHMtjiPjS0GKaHZvv4JofOl6+YNYxqg1YVGVteUpjdW5fUGuBMJ2t/951LJREMHk9/gqrLmHA4D6QkTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772759206; c=relaxed/simple;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=ZgbBzk+kFv301xZK2SezQKeGQax1eAQFu19zYdYwujnJVaDqci2O1Uz+SFCQzhl/HFc8PRQnGjrkw2n6w1EVvmVVZ+MKxt7I5mNiYa9r9DMrfQz5RMmH3xjOE4FvbXiPFZ3dFpjJlPjC4ipX/AHblpUIkXcelCNTyQ3YWnJtM5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpgLSei4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpgLSei4"
Received: by smtp.kernel.org (Postfix)
	id 3CB11C2BC87; Fri,  6 Mar 2026 01:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EB3C116C6;
	Fri,  6 Mar 2026 01:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772759206;
	bh=U8tiEFGD8hzWRhiZza8CPTa4tbVmgjRwBsFUEKBk/ys=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=EpgLSei4ILvXzDe4V76a240VhOoaxPv/UPe7aXYB7POS7fzTm/NfZ0TEoMrtq8Q+4
	 AEbEhQ7pjIu44WO39Qf49CqedBROjC61/tjcgc6hK91Aze4+592ejr504yUjQpqwaz
	 vy3o4M790mZMIN/GMb76rQOKqLEbwVyN5TW/V+XDOjlfcGVUvW+6FKIyNOJXPtxVuR
	 7+h4d2lRKv70ZYQ58+7LsUPAxstzxh4K9tqmNkVj+fRK9EDJqAym6/yLIzVcZob7cz
	 68EbYqvHPPInbW37yd/2qRHKIqISSEdZPmndkI5ZE+i54sL0BUS2+0ucjgd1KaYMK5
	 yOM/DwF/o08rw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 058993808200;
	Fri,  6 Mar 2026 01:06:47 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: B4 Bugbot <bugbot+b4@kernel.org>
To: tools@kernel.org, konstantin@linuxfoundation.org, 
 miguel.ojeda.sandonis@gmail.com
Message-ID: <20260306-b9453f65-b5f5c8b7f70d@git.kernel.org>
In-Reply-To: <CANiq72nLuYfoVnWGjmEmUJDKSpFJq9wUXfTND1e3cjwhe0KFFQ@mail.gmail.com>
References: <CANiq72nLuYfoVnWGjmEmUJDKSpFJq9wUXfTND1e3cjwhe0KFFQ@mail.gmail.com>
Subject: Re: `b4` drops added trailers with peculiar patch
X-Git-Bug-Id: 9453f6585824edbe1eb5a14fb2fc9f9ec2bbba7f6610a110b001176a17815709
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Mar 2026 01:06:47 +0000 (UTC)

Hello:

This conversation is now tracked by b4 bug tracker.
There is no need to do anything else, just keep talking.

--
Deet-doot-dot, I am a bot.
b4 bug tracker (bugspray 0.1-dev)


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E69174E5
	for <tools@linux.kernel.org>; Tue, 11 Jul 2023 10:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BFAC433C9
	for <tools@linux.kernel.org>; Tue, 11 Jul 2023 10:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689069948;
	bh=GWzKPLvqsC96TZU456ZizomFd2IuF4AWGr79IhDTQPw=;
	h=Date:From:To:Subject:From;
	b=fMKNv8l3r6I+zWUg1ycCirCeqkDtRZTED0pAke908M6CkDs8ZnhuL44FApaO48cD1
	 uEea+by2GFsEd6I1fe15tVKGc+8KDt4dehDSFU9B9rQmfJVnStFzC0rkvPy8ZZlpXh
	 b7VmBiaA8GoXQB1Z4epGqRO0UYe15RtCKi0Tke98Go9D3cSIZE+a1f77WlWQ4y39Hz
	 94JzzvE5y6VyFNgJ58Bs8sDXIf4+2MU2SCc48AR6pNg5C0BOibkyy/Z/784lXRoJKq
	 Dtng4af6Bo0ER3pJFdUVI1gvbEQjCccutUEnPiEu2Ejxzi1NpCRLlvqhZwJa/O1DN+
	 sg223FrbLBguA==
Date: Tue, 11 Jul 2023 12:05:44 +0200
From: Christian Brauner <brauner@kernel.org>
To: tools@linux.kernel.org
Subject: Picking up changed commit subjects when generating thank you
 messages & patch list generation
Message-ID: <20230711-berechenbar-bordstein-b22e1f7f9835@brauner>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hey everyone,

As always, very happy about b4!

I have two features requests:

(1) Automatically picking up changed commit subject lines
    When applying series via shazam or am commit message subjects
    sometimes need to be tweaked afterwards. But while b4 ty picks up
    commit hash changes caused by e.g., git commit --amend it doesn't
    pick up the changed subject.
    
    For example, the patch originally sent with commit subject "aaa" got
    applied. Afterwards it was amended to "bbb". But b4 ty would still
    generate:
    
    [1/1] aaa
          https://git.kernel.org/vfs/vfs/c/7b2edd278691
    
    in the thank you letter.
    
    A welcome improvement would be if the commit subject change could be
    picked up in addition to the changed hash. Currently this must be done
    by hand.
    
    A concrete example can be found here under the Message-Id
    <20230711-zumindest-anarchie-18d41e1893e3@brauner>

(2) Let b4 support generating a patch list for a specified range of commits
    Sometimes there are scenarios where it would be helpful to let b4
    generate a list of applied commits for a range of commits (even if
    not under direct control of b4):

    [01/92] subsystem1: long
            https://git.kernel.org/vfs/vfs/c/ead310563ad2
    [02/92] subsystem2: long
    .
    .
    .
    [92/92] subsystem92: list
            https://git.kernel.org/vfs/vfs/c/f42faf14b838

    that can then be copy-pasted into a ty message.

    b4 has all the nice info and gitconfig options such as:
    thanks-am-template, thanks-treename, thanks-commit-url-mask that
    would make this just ultra useful.

Thanks!
Christian
